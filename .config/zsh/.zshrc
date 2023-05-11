export ZDOTDIR="/home/paul/.config/zsh"

export XDG_STATE_HOME="$HOME/.local/state"

# oh-my-zsh
export ZSH="/usr/share/oh-my-zsh"
zstyle ':omz:update' mode disabled

ZSH_THEME="awesomepanda"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  bundler
  dotenv
)

source $ZSH/oh-my-zsh.sh

# put compdumps in the cache instead of home
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export HISTFILE="$XDG_STATE_HOME"/zsh/history

# antidot
eval "$(antidot init)"

# get rid of .python_history
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"

# interaction
bindkey -e
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
setopt correct

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='helix'
fi

export PAGER="bat -p"

# stack bin directory
export PATH="$HOME/.local/bin:$PATH"

# aliases
alias ls='exa'
alias l='exa -la --icons --git'
alias la='exa -a --icons --git'
alias lla='exa -la --icons --git'
alias lt='exa -laT --icons --git'
alias x='xdg-open'
alias pacman='pacman --color auto'
alias aur='auracle'
alias qmv='qmv --format destination-only'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias v='nvim'
alias dots='/usr/bin/git --git-dir=$XDG_CONFIG_HOME/dotfiles.git/ --work-tree=$HOME'
alias ip='ip -c'
alias hx='helix'

# reset sudo timeout and
# alias expand commands following sudo
alias sudo='sudo -v; sudo '

# gcloud
GCLOUD_DIR="/opt/google-cloud-sdk"
if [ -d "$GCLOUD_DIR" ]; then
  source $GCLOUD_DIR/completion.zsh.inc
  source $GCLOUD_DIR/path.zsh.inc
fi

if [ -x /usr/bin/pyenv ]; then
  eval "$(pyenv init -)"
fi

# fzf
source /usr/share/fzf/key-bindings.zsh

#syntax highlighting - must be at end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
