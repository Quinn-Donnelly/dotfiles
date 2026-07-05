# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
# Add this to your ~/.bashrc

# Bind Ctrl-F for sesh (project/tmux session switcher)
sesh_connect() {
    READLINE_LINE=""
    READLINE_POINT=0
    tmux-sessionizer
}
bind -x '"\C-f":sesh_connect'

# Reload configs (tmux + bash) on Ctrl-R
reload_config() {
    READLINE_LINE=""
    READLINE_POINT=0
    source ~/.bashrc
    if command -v tmux &>/dev/null && tmux list-sessions &>/dev/null 2>&1; then
        tmux source-file ~/.config/tmux/tmux.conf
    fi
}
bind -x '"\C-r":reload_config'

# Move reverse-history-search to Ctrl-S
stty -ixon
bind '"\C-s":reverse-search-history'
PATH="$PATH:$HOME/.local/bin/scripts"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init bash)"; fi
