source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle git
antigen bundle osx
antigen bundle brew
antigen bundle vi-mode
antigen bundle npm

autoload -U promptinit; promptinit
prompt pure

setopt vi

export LANG=en_US.UTF-8

# Customize to your needs...
path=(
  $path
  /opt/local/bin
  /opt/local/sbin
  /usr/local/git/bin
  /usr/local/bin
  /usr/bin
  /usr/local/sbin
  /usr/sbin
  /sbin
  $HOME/bin
)

export EDITOR=vim

alias ll='ls -lh'
alias l='ls -lah'

alias gd='git diff --color-words'
alias gds='git diff --staged --color-words'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%C(yellow)(%an, %C(white)%ar)"'
alias gw='git-working-history'

### alias git to hub
eval "$(hub alias -s)"

bindkey -v
bindkey '^R' history-incremental-search-backward
