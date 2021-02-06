# https://wiki.debian.org/Zsh

EDITOR=emacs

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"          # reload zsh configuration

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# N_PREFIX=/usr/local/n
export N_PREFIX=~/.n

path+=($HOME/.local/bin)

path=($N_PREFIX/bin $path)

path=($HOME/.npm-global/bin $path)

export PATH

autoload -Uz compinit promptinit
compinit
promptinit

