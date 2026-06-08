# [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

export ZSH="$HOME/.oh-my-zsh"
export MOZ_ENABLE_WAYLAND=0


ZSH_THEME="steeef"

zstyle ':omz:update' mode auto


# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git ssh-agent zsh-syntax-highlighting history-substring-search)


source $ZSH/oh-my-zsh.sh  ~

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

EDITOR=emacs
KUBE_EDITOR=emacs


export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
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

export N_PREFIX=~/.n

path=($path ~/.npm-global/bin )


export MINIKUBE_HOME=/var/lib/docker/minikube

fpath+=(~/.config/hcloud/completion/zsh)

autoload -Uz compinit promptinit
compinit
promptinit

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

# export DOCKER_HOST=unix:///run/user/1000/docker.sock


source <(kubectl completion zsh)

# eval $(minikube -p minikube docker-env)


export MOZ_DISABLE_RDD_SANDBOX=1
export LIBVA_DRIVER_NAME=nvidia
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_nvidia.json



path=(~/.local/bin $path)

path=(~/bin $path)

[ -f "/home/peterbecich/.ghcup/env" ] && . "/home/peterbecich/.ghcup/env" # ghcup-env
