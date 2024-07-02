# olimorris/tmux-pomodoro-plus

set -g @pomodoro_toggle 'p'           # Start/pause a Pomodoro/break
set -g @pomodoro_cancel 'P'           # Cancel the current session
set -g @pomodoro_skip '_'             # Skip a Pomodoro/break

set -g @pomodoro_mins 50              # The duration of the Pomodoro
set -g @pomodoro_break_mins 12         # The duration of the break after the Pomodoro completes
set -g @pomodoro_intervals 3          # The number of intervals before a longer break is started
set -g @pomodoro_long_break_mins 25   # The duration of the long break
set -g @pomodoro_repeat 'off'          # Automatically repeat the Pomodoros?
set -g @pomodoro_disable_breaks 'off' # Turn off breaks

set -g @pomodoro_on "#[fg=$text_red]🍅"                      # The formatted output when the Pomodoro is running
set -g @pomodoro_complete "#[fg=$text_green]🍅"              # The formatted output when the break is running
set -g @pomodoro_pause "#[fg=$color_yellow]🍅"               # The formatted output when the Pomodoro/break is paused
set -g @pomodoro_prompt_break "#[fg=$color_green]⏲︎ break?"   # The formatted output when waiting to start a break
set -g @pomodoro_prompt_pomodoro "#[fg=$color_gray]⏱︎ start?" # The formatted output when waiting to start a Pomodoro

set -g @pomodoro_menu_position "R"  # The location of the menu relative to the screen
set -g @pomodoro_sound 'on'         # Sound for desktop notifications (Run `ls /System/Library/Sounds` for a list of sounds to use on Mac)
set -g @pomodoro_notifications 'on' # Enable desktop notifications from your terminal
set -g @pomodoro_granularity 'on'   # Enables MM:SS (ex: 00:10) format instead of the default (ex: 1m)

set -g @pomodoro_interval_display "[%s/%s]"

# Default keybindings
# <tmux-prefix> C-p to open the Pomodoro timer menu
# <tmux-prefix> M-p to set a custom Pomodoro timer
# <tmux-prefix> e to restart a Pomodoro
