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
[[ -n $TMUX ]] && export TERM="screen-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

bindkey '^H' backward-kill-word
bindkey '5~' kill-word

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

UNCRUSTIFY_CONFIG=~/git/sotfiles/nvim/uncrustify.cfs

##  ALIASES

alias l="exa --oneline --classify --group-directories-first --long --icons --color=auto --git"
alias sl="exa --oneline --classify --group-directories-first --long --icons --color=auto --git"

alias copy='rsync -vhae ssh --progress'
alias copyappend='rsync -vhae ssh --progress --append'

alias cat='bat --paging=never'

alias gs="git status"
alias gst="/usr/bin/gst"

alias ":q"="exit"
alias ":Q"="exit"
alias ":wq"="exit"
alias ":WQ"="exit"

# needs to be separately installed
eval $(thefuck --alias)

export PATH=$PATH:~/shellscripts
export PATH=$PATH:/usr/sbin
export PATH=$PATH:~/Toolchains/*/bin/
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/share/gem/ruby/*/bin

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
function fzf_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  bindkey -M viins '^R' fzf-history-widget
  bindkey -M vicmd '^R' fzf-history-widget
  [ -f /usr/share/fzf/fzf-extras.zsh ] && source /usr/share/fzf/fzf-extras.zsh
  [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
  [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
  export FZF_DEFAULT_COMMAND='fd . ~ --type f --hidden --follow --color=always'
  export FZF_DEFAULT_OPTS="--ansi"
  # export FZF_DEFAULT_OPTS=""
  export FZF_TMUX_OPTS="-u 60%"

  # Options to fzf command
  export FZF_COMPLETION_OPTS='+c -x'
}
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


function zvm_keybinds() {
  zvm_bindkey vicmd '^R' fzf-history-widget
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey viins '^H' backward-kill-word
  zvm_bindkey viins '^[^?' backward-kill-word
  zvm_bindkey viins '5~' kill-word
  zvm_bindkey viins '^[[3;3~' kill-word
}

zvm_after_init_commands+=(fzf_init)
zvm_after_init_commands+=(zvm_keybinds)

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:/usr/local/cudnn/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/skyline/Projects/alex_projects/assets/rembg/venv/lib64/python3.11/site-packages/tensorrt_libs

#this must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
