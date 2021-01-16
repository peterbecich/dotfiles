source ~/dotfiles/bash_aliases_mac.sh


export PATH=/opt/local/bin:$PATH
# export PATH=$PATH:/usr/local/opt

# export PATH=~/.npm-packages/bin:$PATH

# export PATH=~/.cabal/bin:$PATH
# export PATH=~/.local/bin:$PATH


export PATH=/opt/local/libexec/gnubin:$PATH

export PATH=~/.local/bin:$PATH

export PATH=~/.ghcup/bin:$PATH

export PATH=~/.npm-packages/bin:$PATH

export PATH=~/.node_n/bin:$PATH

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


