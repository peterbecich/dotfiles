source ~/dotfiles/bash_aliases_mac.sh

# export PATH=/opt/local/bin:$PATH

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

test -r /sw/bin/init.sh && . /sw/bin/init.sh

export LESSOPEN="| /opt/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# export ALTERNATE_EDITOR=""
# export EDITOR="emacsclient -t"
# export VISUAL="emacsclient -c"
