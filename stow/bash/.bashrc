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

# Path to your script (full path)
MY_SCRIPT="$HOME/.local/bin/scripts/tmux-sessionizer"

# Function to run your script
run_my_script() {
    # Clear the current line before running the script
    READLINE_LINE=""
    READLINE_POINT=0
    "$MY_SCRIPT"
}

# Bind Ctrl-F to run your function
bind -x '"\C-f":run_my_script'
PATH="$PATH:$HOME/.local/bin/scripts"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init bash)"; fi
