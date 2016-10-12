
# Path to your oh-my-zsh installation.
export ZSH=/Users/alee/.oh-my-zsh

export PATH=$HOME/homebrew/bin/:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:$PATH
PYTHONPATH="/Users/alee/homebrew/lib/python2.7/site-packages/:$PYTHONPATH"
export PYTHONPATH
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="crcandy"
ZSH_THEME="adlee"
#ZSH_THEME="bullett-train-custom"
#ZSH_THEME="wedisagree"
#ZSH_THEME="dracula"

# Uncomment for 256 colo terminal
export TERM="xterm-256color"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
#HIST_IGNORE_DUPS="false"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git docker tmux vi-mode zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit
source ~/.zsh/aliases



#TRAPALRM() {
#  zle reset-prompt
#}

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
unsetopt hist_ignore_dups
unset _POWERLINE_SAVE_WIDGET
set -o vi 

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh"
#
# Bind alt-left and alt-right
#
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward


#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1
#
#function histsearch() { fc -lim "$@" 1 }


#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[34;3@" up-case-word
bindkey "^[[35;4@" undo
bindkey "^[[35;5@" redo
bindkey "^[[33;2&" backward-kill-word
bindkey -rM vicmd '^[[2~'
bindkey -sM vicmd '^[' '^G'
bindkey -sM viins '^[[2~' '^X' 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
