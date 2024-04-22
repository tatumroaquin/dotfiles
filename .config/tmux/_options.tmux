unbind C-b
set -g prefix M-a

set -g mouse on
set -g renumber-windows on
set -g status-position top

set -g base-index 1
setw -g mode-keys vi

# Creating splits
bind-key c   new-window -c '#{pane_current_path}'
bind-key \\  split-window -h -c '#{pane_current_path}'
bind-key "'" split-window -v -c '#{pane_current_path}'

# Navigate split panes
bind-key h select-window -t -1
bind-key l select-window -t +1

# Reorganising window positions
bind-key j swap-window -t -1\; select-window -t -1
bind-key k swap-window -t +1\; select-window -t +1

# Navigating between windows
bind-key -n C-h previous-window
bind-key -n C-l next-window
