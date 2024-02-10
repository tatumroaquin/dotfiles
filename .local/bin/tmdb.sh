#!/bin/sh

SEARCH_STRING="$1"

# Insert your API JWT TOKEN here
API_TOKEN=""

# '-G' is important see https://stackoverflow.com/a/58885676
RESULTS=$(curl -s -G \
  --url "https://api.themoviedb.org/3/search/tv" \
  --header "Authorization: Bearer $API_TOKEN" \
  --header 'accept: application/json' \
  --data-urlencode "include_adult=false" \
  --data-urlencode "language=en-US" \
  --data-urlencode "page=1" \
  --data-urlencode "query=$SEARCH_STRING"
)

ID=$(echo "$RESULTS" | jq .results[0].id);
TITLE=$(echo "$RESULTS" | jq .results[0].name);

DATA=$(curl -s -G \
  --url "https://api.themoviedb.org/3/tv/$ID" \
  --header "Authorization: Bearer $API_TOKEN" \
  --header 'accept: application/json'
);
NUM_OF_SEASONS=$(echo "$DATA" | jq .number_of_seasons)

for SEASON in $(seq 1 "$NUM_OF_SEASONS"); do
  EPISODES=$(curl -s -G \
    --url "https://api.themoviedb.org/3/tv/$ID/season/$SEASON" \
    --header "Authorization: Bearer $API_TOKEN" \
    --header 'accept: application/json'
  );
  echo "$EPISODES" | jq -r '.episodes[] | "S\(if .season_number < 10 then "0\(.season_number)" else "\(.season_number)" end)E\(if .episode_number < 10 then "0\(.episode_number)" else "\(.episode_number)" end) - \(.name)"'
done

echo "Id: $ID"
echo "Title: $TITLE"
echo "Seasons: $NUM_OF_SEASONS"
