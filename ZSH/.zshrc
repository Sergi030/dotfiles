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

# Syntax correction 
#  ENABLE_CORRECTION="true"

# SSH KEYS
  export SSH_KEY_PATH="~/.ssh/rsa_id"
  export PATH=~/.npm-global/bin:$PATH
  export PATH=~/.gem/ruby/2.5.0/bin:$PATH
# Alias
  . ~/.config/zsh/alias.zsh

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

