# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export PATH=$HOME/Programacio/edge/loadsensing-servers/utils:$PATH

if [ -d $HOME/.config/secrets.d/ ]
then
  for file in $HOME/.config/secrets.d/*; do
    [ -f "$file" ] && source "$file"
  done
fi
 
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="oh-my-prompt"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias podman="docker"
alias podman-compose="docker-compose"
DISABLE_UNTRACKED_FILES_DIRTY="true"
export HIST_STAMPS=mm/dd/yyyy

# [Home]/[End] - oh-my-zsh binds these from terminfo (\eOH / \eOF for
# xterm-256color), but tmux always sends the vt220 form \e[1~ / \e[4~, so the
# keys do nothing inside tmux. Bind every variant explicitly.
for keymap in emacs viins vicmd; do
  bindkey -M $keymap "^[[1~" beginning-of-line   # tmux, rxvt, linux console
  bindkey -M $keymap "^[[H"  beginning-of-line   # xterm normal mode
  bindkey -M $keymap "^[OH"  beginning-of-line   # xterm application mode
  bindkey -M $keymap "^[[7~" beginning-of-line   # urxvt
  bindkey -M $keymap "^[[4~" end-of-line
  bindkey -M $keymap "^[[F"  end-of-line
  bindkey -M $keymap "^[OF"  end-of-line
  bindkey -M $keymap "^[[8~" end-of-line
done
unset keymap

# Many of the GCE hosts in ~/.ssh/config ship without ncurses-term, so they have
# no tmux-256color entry and everything curses-based breaks there. screen-256color
# is present on any remote and describes the same key sequences tmux sends.
ssh() {
  if [[ $TERM == tmux* ]]; then
    TERM=screen-256color command ssh "$@"
  else
    command ssh "$@"
  fi
}

# Colorize `ip` output at the terminal; auto strips color when piped or captured.
alias ip='ip -c=auto'

# Hyprland exports its instance signature into the systemd user environment, not
# into login shells, so hyprctl in any shell Hyprland did not spawn fails with
# "HYPRLAND_INSTANCE_SIGNATURE not set!" and tells you to pass --instance.
if [[ -z $HYPRLAND_INSTANCE_SIGNATURE && -d ${XDG_RUNTIME_DIR:-/run/user/$UID}/hypr ]]; then
  _hypr_sig=$(systemctl --user show-environment 2>/dev/null | sed -n 's/^HYPRLAND_INSTANCE_SIGNATURE=//p')
  # If systemd does not have it either, fall back to the newest live socket dir.
  [[ -z $_hypr_sig ]] && _hypr_sig=$(ls -t ${XDG_RUNTIME_DIR:-/run/user/$UID}/hypr 2>/dev/null | head -1)
  [[ -n $_hypr_sig ]] && export HYPRLAND_INSTANCE_SIGNATURE=$_hypr_sig
  [[ -z $WAYLAND_DISPLAY ]] && export WAYLAND_DISPLAY=$(systemctl --user show-environment 2>/dev/null | sed -n 's/^WAYLAND_DISPLAY=//p')
  unset _hypr_sig
fi
