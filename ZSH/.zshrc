# Locale to es_ES.UTF-8
  . ~/.config/zsh/locale.zsh

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Full color Term
  export TERM="xterm-256color"

# Theme
  ZSH_THEME="oh-my-prompt"

# Check update of "OH MY ZSH" in days
  export UPDATE_ZSH_DAYS=7

# Alias
  . ~/.config/zsh/alias.zsh
  . ~/.config/zsh/hashes.zsh

plugins=(
  git
  docker
  docker-compose
)

compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

bindkey "[1~" beginning-of-line
bindkey "[4~" end-of-line
source $ZSH/oh-my-zsh.sh
