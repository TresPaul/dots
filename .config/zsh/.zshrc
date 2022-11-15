#zmodload zsh/zprof

# TODO: make the following generic; $XDG_DATA_HOME etc. doesn't get exported until later?
#
# ZDOTS
export ZDOTDIR="/home/paul/.config/zsh"

# oh-my-zsh
export ZSH="/home/paul/.local/share/oh-my-zsh"
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

# antidot
eval "$(antidot init)"

# TODO: fix antidot histfile not bash
# workaround:
export HISTFILE="$ZDOTDIR/.zsh_history"

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
alias l='exa -l --icons --git'
alias la='exa -a --icons --git'
alias lla='exa -la --icons --git'
alias lt='exa -lT --icons --git'
alias x='xdg-open'
alias pacman='pacman --color auto'
alias aur='auracle'
alias qmv='qmv --format destination-only'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias v='nvim'
alias dots='/usr/bin/git --git-dir=$XDG_CONFIG_HOME/dotfiles.git/ --work-tree=$HOME'
alias tw='tweeterr'
alias ip='ip -c'

# computer-specific aliases: change IP below
alias sshfslink='sshfs 10.0.2.240:/home/paul /mnt'
alias sshfsunlink='fusermount3 -u /mnt'

# gcloud

GCLOUD_DIR="/opt/google-cloud-sdk"
if [ -d "$GCLOUD_DIR" ]; then
  source $GCLOUD_DIR/completion.zsh.inc
  source $GCLOUD_DIR/path.zsh.inc
fi

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

# docker rootless
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# TODO: get rid of the following dotfiles in home:
# .android
# .audacity-data
# .bash_logout
# .bash_profile
# .bashrc
# .boto
# .cddb
# .cookiecutters
# .dotfiles.git
# .fauna-shell
# .ghc
# .gnotero.sqlite
# .gphoto
# .gsutil
# .helm
# .helm-synth
# .hugin
# .hugindata
# .ipfs
# .ipynb_checkpoints
# .ipython
# .jackdrc
# .jupyter
# .kde4
# .keras
# .log
# .minikube
# .mozilla
# .NERDTreeBookmarks
# .netlify
# .netrc
# .ngrok2
# .pdsettings
# .pki
# .processing
# .profile
# .ptbt
# .pulse
# .pyenv
# .python_history
# .ssh
# .texlive
# .thunderbird
# .vim
# .viminfo
# .vimundos
# .vscode-oss
# .vst3
# .vue-cli-ui
# .vuerc
# .wget-hsts
# .wine
# .Xauthority
# .xmonad
# .zotero

if [ -x /usr/bin/pyenv ]; then
  eval "$(pyenv init -)"
fi

#source /usr/share/nvm/init-nvm.sh

#syntax highlighting - must be at end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#zprof
