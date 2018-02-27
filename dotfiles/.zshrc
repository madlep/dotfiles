# Path to your oh-my-zsh installation.
export ZSH=/Users/madlep/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)

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

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/.mix:$PATH"

source $ZSH/oh-my-zsh.sh

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

export HOMEBREW_NO_ANALYTICS=1 # because fuck users that's why
export GIT_EDITOR="vim"
export EDITOR="vim"
export ERL_AFLAGS="-kernel shell_history enabled"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which exenv > /dev/null; then eval "$(exenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

alias lah='ls -laFh'
alias l='ls -laF'
alias lart='ls -laFrt'

# git stuff
alias gco='git checkout'
alias gcv='git commit -v'
alias gd='git diff'
alias gs='git status'

# bundle stuff
alias be='bundle exec'
alias ber='bundle exec rake'

alias tma='tmux attach-session'

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

function tm {
  tmuxomatic ~/tmuxomatic/$1
}

function tmwn {
  tmux rename-window $(basename $(pwd))
}

function tmsn {
  tmux rename-session $(basename $(pwd))
}
