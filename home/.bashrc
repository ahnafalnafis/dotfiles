# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###############################################################################
#################################### TMUX #####################################
###############################################################################
if command -v tmux &> /dev/null && [ -n "$PS1" ] &&\
  [[ ! "$TERM" =~ screen ]] &&\
  [[ ! "$TERM" =~ tmux ]] &&\
  [ -z "$TMUX" ]; then
  exec tmux
fi

###############################################################################
################################### Basics ####################################
###############################################################################
PNPM_HOME="/home/ahnaf/.local/share/pnpm"
PATH="$PATH:$PNPM_HOME"

EDITOR="$(which vim)"

SUDO_PROMPT="Password 🔑: "
FZF_DEFAULT_OPTS=(--layout=reverse --prompt=\ )
WALLPAPERS="$HOME/Pictures/Wallpapers/Useless"

# C/C++ compilers:
CC="/usr/bin/gcc"
CXX="/usr/bin/clang++"

# Avro keyboard:
GTK_MODULE="ibus"
XMODIFIERS="@im=ibus"
QT_IM_MODULE="ibus"

# Background color:
TERM_BACKGROUND="dark"

hour="$(date +%H)"
sunrise_time=$((6 + 1))
sunset_time=$((19 - 1))

# Use light background during day light.
# if [ "$hour" -ge "$sunrise_time" ] && [ "$hour" -lt "$sunset_time" ]; then
#   TERM_BACKGROUND="light"
# fi

# Set color schemes for terminal apps.
color_scheme="gruvbox"
BAT_THEME="$color_scheme-$TERM_BACKGROUND"

theme_src="$HOME/.config/kitty/themes/$color_scheme-$TERM_BACKGROUND.conf"
theme_dest="$HOME/.config/kitty/themes/index.conf"
ln -sf "$theme_src" "$theme_dest"

# Bash history. -1 means unlimited records will be stored.
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL="erasedups:ignoreboth"
HISTIGNORE="clear:exit:cd:pwd:ls:la:ll"
shopt -s histappend

###############################################################################
################################ Key bindings #################################
###############################################################################
source /usr/share/fzf/key-bindings.bash

###############################################################################
################################### Prompt ####################################
###############################################################################
reset='\[\033[00m\]'
blue='\[\033[00;34m\]'

prompt_indicator="❯"
current_directory="$blue\W$reset"

PS1="$current_directory $prompt_indicator "

###############################################################################
################################### Aliases ###################################
###############################################################################
# Unset all of the previous aliases.
unalias -a

# Directory listing:
alias ls="ls -AF --color=auto"
alias ll="tree -alC --dirsfirst --gitignore -I .git"
alias la="ll -L 1"

# Easy movement:
alias ..="cd .. && pwd"
alias ...="cd ../.. && pwd"
alias ....="cd ../../.. && pwd"

# Git:
alias gs="git status -s"
alias ga="git add"
alias gm="git commit"
alias gb="git branch"
alias gco="git checkout"

# Vim:
alias vim='VIM_DEV_MODE=1 $EDITOR'

# Pnpm:
alias pn="$(which pnpm)"

# Misc:
alias sb="source ~/.bashrc"
alias mkdir="mkdir -pv"
alias rm="rm -fv"

###############################################################################
################################## Clear ups ##################################
###############################################################################
unset hour
unset color_scheme
unset theme_src
unset theme_dest
unset prompt_indicator
unset current_directory
unset reset
unset blue
unset sunrise_time
unset sunset_time

###############################################################################
################################### Exports ###################################
###############################################################################
export BAT_THEME
export CC
export CXX
export EDITOR
export FZF_DEFAULT_OPTS
export GTK_MODULE
export HISTCONTROL
export HISTFILESIZE
export HISTSIZE
export PATH
export PNPM_HOME
export PS1
export QT_IM_MODULE
export SUDO_PROMPT
export TERM_BACKGROUND
export WALLPAPERS
export XMODIFIERS
