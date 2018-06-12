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

# PATH 
  export PATH=~/.npm-global/bin:$PATH
  export PATH=~/.gem/ruby/2.5.0/bin:$PATH
  export PATH=~/.bin:$PATH
  export PATH=~/bin:$PATH
  export PATH=~/.ls_bin:$PATH
  export PATH=~/.composer/vendor/bin:$PATH
# Alias
  . ~/.config/zsh/alias.zsh
  . ~/.config/zsh/hashes.zsh

plugins=(
  git
)
bindkey "e[1~" beginning-of-line
bindkey "e[4~" end-of-line
source $ZSH/oh-my-zsh.sh

