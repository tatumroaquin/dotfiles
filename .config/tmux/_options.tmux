unbind C-b
set -g prefix M-a

set -g mouse on
set -g renumber-windows on
set -g status-position top
set -g allow-passthrough on

set -g base-index 1
set -g pane-base-index 1
set -g detach-on-destroy off

# Vim like selection and copy
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

# Create panes in the current path
bind-key c   new-window -c '#{pane_current_path}'
bind-key \\  split-window -h -c '#{pane_current_path}'
bind-key "'" split-window -v -c '#{pane_current_path}'

# Navigate between windows
unbind C-n
bind-key -n C-n select-window -t -1
bind-key -n C-p select-window -t +1

# Reorganising window positions
bind-key j swap-window -t -1\; select-window -t -1
bind-key k swap-window -t +1\; select-window -t +1

# Navigate between split panes
bind-key -n C-h previous-window
bind-key -n C-l next-window

# Tmux auto-session script
# https://github.com/junegunn/fzf/issues/1841#issuecomment-580975759
bind-key -n C-f run-shell -b "tmux-session.sh"

bind-key -n C-d command-prompt -p "Dir session:" "run-shell 'tmux-session.sh \'%%\''"

# Tmux custom session
bind-key -n C-e command-prompt -p "New session:" "new-session -s '%%'"

# Tmux fzf-tmux find windows
# bind-key -n C-g run-shell -b "tmux-window.sh"

set -ga terminal-features "*-256color:256"
set -ga terminal-features "*-256color:RGB"
set -ga terminal-features "*-256color:sync"
set -ga terminal-features "*-256color:ccolour"
set -ga terminal-features "*-256color:hyperlinks"
set -ga terminal-features "*-256color:sixel"
set -ga terminal-features "*-256color:strikethrough"
