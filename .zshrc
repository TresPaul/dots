# oh-my-zsh
export ZSH="/home/paul/.oh-my-zsh/"

ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  bundler
  dotenv
)

source $ZSH/oh-my-zsh.sh

# interaction
bindkey -e
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
setopt correct

# remove user@host prompt on local machine
prompt_context(){}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# aliases
alias ls='exa'
alias l='exa -l'
alias la='exa -a'
alias lla='exa -la'
alias lt='exa -lT'
alias x='xdg-open'
alias pacman='pacman --color auto'
alias aur='auracle'
alias qmv='qmv --format destination-only'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias v='nvim'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias tw='tweeterr'

# computer-specific aliases: change IP below
alias sshfslink='sshfs 10.0.2.240:/home/paul /mnt'
alias sshfsunlink='fusermount3 -u /mnt'

# gcloud
source /opt/google-cloud-sdk/completion.zsh.inc
source /opt/google-cloud-sdk/path.zsh.inc

# latex
# (awk by Peter on SE: https://tex.stackexchange.com/a/416658)
# -> make better at some point.
dolatex () {
  texcount -1 -sum $1 && \
  echo "# (1/4) RUNNING pdflatex 1" && \
  pdflatex --interaction=nonstopmode $1 | awk 'BEGIN{IGNORECASE = 1}/warning|!/,/^$/;' && \
  echo "# (2/4) RUNNING biber" && \
  biber -q ${1//.tex} && \
  echo "# (3/4) RUNNING pdflatex 2" && \
  pdflatex --interaction=nonstopmode $1 | awk 'BEGIN{IGNORECASE = 1}/warning|!/,/^$/;' && \
  echo "# (4/4) RUNNING pdflatex 3" && \
  pdflatex --interaction=nonstopmode $1 | awk 'BEGIN{IGNORECASE = 1}/warning|!/,/^$/;' && \
  echo "# DONE"
}

#syntax highlighting - must be at end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/nvm/init-nvm.sh
eval "$(pyenv init -)"
