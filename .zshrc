ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gabro"

# disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(git osx brew sublime hophop hub npm zsh-syntax-highlighting vi-mode)

setopt vi
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:usr/sbin:/sbin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/bin:$PATH

export EDITOR=vim

alias ll='ls -lh'
alias l='ls -lah'

alias gd='git diff --color-words'
alias gds='git diff --staged --color-words'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%C(yellow)(%an, %C(white)%ar)"'
alias gw='git-working-history'
alias gstat='git diff --stat `git hash-object -t tree /dev/null` | tail -1'

### alias git to hub
eval "$(hub alias -s)"

### git new-workdir
PATH=$PATH:/usr/local/share/git-core/contrib/workdir

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey "^R" history-incremental-search-backward

# sqlplus configuration
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2:$DYLD_LIBRARY_PATH
export PATH=/opt/oracle/instantclient_11_2:$PATH

# android
export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# notify me when a commands finishes and terminal is in background
function f_notifybg {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)
  # No point in waiting for the command to complete
  notifybg "$CMD" "$LAST_EXIT_CODE" &
}

export PS1='$(f_notifybg)'$PS1

export TERM='xterm-256color'

export NVM_DIR="/Users/gabro/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export alias sbt=sbt|tee -a ~/.sbt_usage
