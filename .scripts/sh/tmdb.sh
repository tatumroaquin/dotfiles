#!/bin/bash
# Author: Tatum Roaquin
# Description: CLI script to retrieve the metadata on TV shows, number of seasons and title names, interfaces with TMDB for backend functionality.

# Insert your API JWT TOKEN string here
API_TOKEN=$(pass show tmdb/ormus | grep 'api-token' | awk -F' ' '{print $2}')

# Get the last argument of the script
SEARCH_STRING="${*: -1}"

usage() {
  echo "Usage: $0 [-i <SERIES_ID> -s <SEASON_NUMBER> -e <EPISODE_NUMBER>] <SERIES_TITLE>"
}

# Get every single season and episode data of the entire series excluding season 0 (specials)
get_all_episodes_data() {
  SERIES_ID="$1"
  NUMBER_OF_SEASONS="$2"

  for SEASON in $(seq 1 "$NUMBER_OF_SEASONS"); do
    EPISODES=$(curl -s -G \
      --url "https://api.themoviedb.org/3/tv/$SERIES_ID/season/$SEASON" \
      --header "Authorization: Bearer $API_TOKEN" \
      --header 'accept: application/json'
    )
    echo "$EPISODES" | jq -r '.episodes[] | "S\(if .season_number < 10 then "0\(.season_number)" else "\(.season_number)" end)E\(if .episode_number < 10 then "0\(.episode_number)" else "\(.episode_number)" end) - \(.name)"'
  done
}

# Get all episodes for one season of a series
get_one_season_data() {
  SERIES_ID="$1"
  SEASON_NUMBER="$2"
  EPISODES=$(curl -s -G \
    --url "https://api.themoviedb.org/3/tv/$SERIES_ID/season/$SEASON_NUMBER" \
    --header "Authorization: Bearer $API_TOKEN" \
    --header 'accept: application/json'
  );
  echo "$EPISODES" | jq -r '.episodes[] | "S\(if .season_number < 10 then "0\(.season_number)" else "\(.season_number)" end)E\(if .episode_number < 10 then "0\(.episode_number)" else "\(.episode_number)" end) - \(.name)"'
}

# Get data on only one episode of a series
get_one_episode_data() {
  SERIES_ID="$1"
  SEASON_NUMBER="$2"
  EPISODE_NUMBER="$3"
  EPISODE_DATA=$(curl -s -G \
    --url "https://api.themoviedb.org/3/tv/$SERIES_ID/season/$SEASON_NUMBER/episode/$EPISODE_NUMBER" \
    --header "Authorization: Bearer $API_TOKEN" \
    --header 'accept: application/json'
  )
  echo "$EPISODE_DATA" | jq -r '"S\(if .season_number < 10 then "0\(.season_number)" else "\(.season_number)" end)E\(if .episode_number < 10 then "0\(.episode_number)" else "\(.episode_number)" end) - \(.name)\nOVERVIEW: \(.overview)"'
}

ALL_SEASONS_FLAG=false

while getopts ":i:a:s:e:" opts; do
  case "${opts}" in
    i)
      SERIES_ID="${OPTARG}"
    ;;
    a)
      ALL_SEASONS_FLAG=true
    ;;

    s)
      SEASON_NUMBER="${OPTARG}"

      if [ -z "$SEASON_NUMBER" ]; then
        echo "Please provide the season number to retrieve"
        exit 1
      fi
    ;;

    e)
      EPISODE_NUMBER="${OPTARG}"

      if [ -z "$EPISODE_NUMBER" ]; then
        echo "Please provide the episode number to retrieve"
        exit 1
      fi
    ;;

    *)
      usage
    ;;
  esac
done

# '-G' is important see https://stackoverflow.com/a/58885676
SEARCH_DATA=$(curl -s -G \
  --url "https://api.themoviedb.org/3/search/tv" \
  --header "Authorization: Bearer $API_TOKEN" \
  --header 'accept: application/json' \
  --data-urlencode "include_adult=false" \
  --data-urlencode "language=en-US" \
  --data-urlencode "page=1" \
  --data-urlencode "query=$SEARCH_STRING"
)

[ -z "$SERIES_ID" ] && SERIES_ID=$(echo "$SEARCH_DATA" | jq .results[0].id)
SERIES_TITLE=$(echo "$SEARCH_DATA" | jq .results[0].name)

SEASON_DETAILS=$(curl -s -G \
  --url "https://api.themoviedb.org/3/tv/$SERIES_ID" \
  --header "Authorization: Bearer $API_TOKEN" \
  --header 'accept: application/json' \
  --data-urlencode "language=en-US" 
)

NUMBER_OF_SEASONS=$(echo "$SEASON_DETAILS" | jq .number_of_seasons)

echo '---------------------------------------'
echo "SERIES ID: $SERIES_ID"
echo "SERIES TITLE: $SERIES_TITLE"
echo "NUM OF SEASONS : $NUMBER_OF_SEASONS"
echo '---------------------------------------'

if [ $ALL_SEASONS_FLAG = true ]; then

  get_all_episodes_data "$SERIES_ID" "$NUMBER_OF_SEASONS"

elif [ -n "$SEASON_NUMBER" ] && [ -z "$EPISODE_NUMBER" ]; then

  get_one_season_data "$SERIES_ID" "$SEASON_NUMBER"

elif [ -n "$SEASON_NUMBER" ] && [ -n "$EPISODE_NUMBER" ]; then

  get_one_episode_data "$SERIES_ID" "$SEASON_NUMBER" "$EPISODE_NUMBER"

fi
