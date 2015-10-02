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
