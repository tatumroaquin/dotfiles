# tmux-plugins/tmux-resurrect
set -g @resurrect-processes 'ssh psql mysql sqlite3'
set -g @resurrect-strategy-nvim 'session'

set -g @resurrect-save 'a'
# set -g @resurrect-restore 'r'
