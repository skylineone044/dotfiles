# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#                  __
#                 /\ \
#    ____     ____\ \ \___   _ __   ___
#   /\_ ,`\  /',__\\ \  _ `\/\`'__\/'___\
#   \/_/  /_/\__, `\\ \ \ \ \ \ \//\ \__/
#     /\____\/\____/ \ \_\ \_\ \_\\ \____\
#     \/____/\/___/   \/_/\/_/\/_/ \/____/
#
#
#                      WITH
#         __                                                            __
#        /\ \                                                          /\ \
#     ___\ \ \___              ___ ___   __  __           ____     ____\ \ \___
#    / __`\ \  _ `\  _______ /' __` __`\/\ \/\ \  _______/\_ ,`\  /',__\\ \  _ `\
#   /\ \L\ \ \ \ \ \/\______\/\ \/\ \/\ \ \ \_\ \/\______\/_/  /_/\__, `\\ \ \ \ \
#   \ \____/\ \_\ \_\/______/\ \_\ \_\ \_\/`____ \/______/ /\____\/\____/ \ \_\ \_\
#    \/___/  \/_/\/_/         \/_/\/_/\/_/`/___/> \        \/____/\/___/   \/_/\/_/
#                                            /\___/
#                                            \/__/


#Start tmux
if [ "$TMUX" = "" ]; then tmux; fi

export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/home/mint/.oh-my-zsh"
# export ZSH="/home/ubuntu/.oh-my-zsh"
export ZSH="/home/skyline/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=$USER

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time os_icon )
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator user context ssh dir dir_writable vcs newline status)

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_DISABLE_RPROMPT=true    #Disable the right promt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=" "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" "  #\u00BB "
POWERLEVEL8K_DIR_ETC_BACKGROUND="009"
POWERLEVEL9K_DIR_ETC_FOREGROUND="015"
POWERLEVEL8K_DIR_DEFAULT_BACKGROUND="009"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="015"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="015"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="004"
POWERLEVEL9K_DIR_HOME_FOREGROUND="015"
POWERLEVEL9K_DIR_HOME_BACKGROUND="004"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="009"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="015"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="009"
POWERLEVEL9K_MODE='nerdfont-complete'

#POWERLEVEL9K_ALWAYS_SHOW_USER=true
#POWERLEVEL9K_USER_ICON="\uF415" #
#POWERLEVEL9K_ROOT_ICON="#"
#POWERLEVEL9K_SUDO_ICON="$" #'\uF09C'


#
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sshpi="ssh pi@192.168.1.120"

# Run ls after cd

# function chpwd() {
#    emulate -L zsh
    # lsd -l
# }

#for key in ${(k)icons[@]}
#do
#    if [[ ! $key =~ 'SEPARATOR' ]]
#    then
#        icons[$key]=" ${icons[$key]} "
#    fi
#done
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)
ZSH_AUTOSUGGEST_USE_ASYNC=1

JDK_HOME="/usr/lib/jvm/java-15-openjdk"
JAVA_HOME="/usr/lib/jvm/java-15-openjdk"
UNCRUSTIFY_CONFIG=~/git/sotfiles/nvim/uncrustify.cfs

##  ALIASES

alias l="exa --oneline --classify --group-directories-first --long --icons --color=auto --git"
alias sl="exa --oneline --classify --group-directories-first --long --icons --color=auto --git"

alias cp='rsync -vhae ssh --progress'
alias cpa='rsync -vhae ssh --progress --append'

alias gs="git status"

alias ":q"="exit"
alias ":Q"="exit"
alias ":wq"="exit"
alias ":WQ"="exit"

alias "autoclick"="sh ~/ShellScripts/autoclick.sh"

alias "n"="nvim ~/git/PrivateStuff/notes.md"

alias "webcam"="vlc v4l2:///dev/video0 & ; clear"

# needs to be eparately installed
eval $(thefuck --alias)

export PATH=$PATH:~/ShellScripts
export PATH=$PATH:/usr/sbin
export STEAM_COMPAT_DATA_PATH=$HOME/proton
set -o HIST_FIND_NO_DUPS
export MANPAGER='nvim +Man!'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# FZF setup
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd . ~ --type f --hidden --follow --color=always'
export FZF_DEFAULT_OPTS="--ansi"
# export FZF_DEFAULT_OPTS=""
export FZF_TMUX_OPTS="-u 60%"

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}
#
# fzf extras
. /usr/share/fzf/fzf-extras.zsh

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

export PATH=$PATH:$HOME/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/

#this must be last
source /home/skyline/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
