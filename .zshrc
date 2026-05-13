# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# powerlevel 10k font
source ~/.p10k.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo vi-mode mix)

# User configuration

#export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
eval "$(/opt/homebrew/bin/brew shellenv)"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/.mix:$PATH"
export PATH="$HOME/.mix/escripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
#
# version manager
eval "$(mise activate zsh)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh
#
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function safe_source()
{
    if [[ -f $1 ]]; then
        source $1
    fi
}


export HOMEBREW_NO_ANALYTICS=1
export GIT_EDITOR="nvim"
export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"


alias lah='ls -laFh'
alias l='ls -laF'
alias lart='ls -laFrt'

# git stuff
alias gco='git checkout'
alias gcv='git commit -v'
alias gd='git diff'
alias gst='git status'

# bundle stuff
alias be='bundle exec'
alias ber='bundle exec rake'

alias tma='tmux attach-session'

export DISABLE_AUTO_TITLE='true'

function c {
  if [ -z $1 ]; then
    # if no arg given, just go up a dir
    cd ..
  else
    cd "$1"
  fi

  # if we changed dir successfully, list contents
  if [ $? -eq 0 ]; then
    ls -laF
  fi
}

# smart fuzzy dir changing
[[ -s `brew --prefix`/etc/profile.d/z.sh ]] && . `brew --prefix`/etc/profile.d/z.sh

# envrc loading with direnv
if [[ -s `brew --prefix`/bin/direnv ]]
then
  eval "$(direnv hook zsh)"
fi

# set tmux window name to current directory
function tmwn {
  tmux rename-window $(basename $(pwd))
}

# set tmux session name to current directory
function tmsn {
  tmux rename-session $(basename $(pwd))
}

function tmclear {
  tmux send-keys -R \; clear-history
}

safe_source ~/.zshrc_local
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
