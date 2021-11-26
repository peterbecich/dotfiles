# https://wiki.debian.org/Zsh

EDITOR=emacs

# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
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

# path=($HOME/bin $path)

path=($HOME/.npm-global/bin $path)

path=(/opt/swift/usr/bin $path)

path=(/usr/local/go/bin $path)

export PATH

export MINIKUBE_HOME=/var/lib/docker/minikube

autoload -Uz compinit promptinit
compinit
promptinit

if [ -e /home/peterbecich/.nix-profile/etc/profile.d/nix.sh ]; then . /home/peterbecich/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(direnv hook zsh)"

vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
