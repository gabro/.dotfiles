source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle git
antigen bundle osx
antigen bundle brew
antigen bundle vi-mode
antigen bundle npm

antigen apply

autoload -U promptinit; promptinit
prompt pure

setopt vi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

export GOPATH=$HOME/buildo/go

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
  $HOME/.fastlane/bin
  $HOME/bin
  $GOPATH/bin
)

export EDITOR=vim

alias v=vim

alias ll='ls -lh'
alias l='ls -lah'

alias gd='git diff --color-words'
alias gds='git diff --staged --color-words'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%C(yellow)(%an, %C(white)%ar)"'
alias gw='git-working-history'

eval "$(hub alias -s)"

bindkey -v
bindkey '^R' history-incremental-search-backward

# nvm support
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# # awless autocompletion
# source /usr/local/share/zsh/site-functions/_awless

export PATH="$HOME/.yarn/bin:$PATH"

alias sbt='f() { sbt "$@" |tee -a ~/.sbt_usage;  };f'

# added by travis gem
[ -f /Users/gabro/.travis/travis.sh ] && source /Users/gabro/.travis/travis.sh

# ocaml/opam
. /Users/gabro/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# alinity-pro dev
function alinityproenv() { COMMIT=$(git rev-parse $1) LOCAL_ALIAS=localhost docker-compose -f ../qia-vm/builder/docker-compose.yml -f ../qia-vm/builder/env-overrides/local.yml up --force-recreate -d }

function alinityproenv-web-build() { docker run -it --rm -v $(pwd):/srv -w /srv node:6.10 /bin/bash -c "rm -rf node_modules; yarn --no-progress; NODE_ENV=production npm run build" }

function alinityproenv-local-web-api() { COMMIT=$(git rev-parse $1) LOCAL_ALIAS=localhost docker-compose -f ../qia-vm/builder/docker-compose.yml -f ../qia-vm/builder/env-overrides/local.yml -f ../qia-vm/builder/env-overrides/local-web.yml -f ../qia-vm/builder/env-overrides/local-api.yml up --force-recreate -d }

function alinityproenv-local-web() { COMMIT=$(git rev-parse $1) LOCAL_ALIAS=localhost docker-compose -f ../qia-vm/builder/docker-compose.yml -f ../qia-vm/builder/env-overrides/local.yml -f ../qia-vm/builder/env-overrides/local-web.yml up --force-recreate -d }

function alinityproenv-local-api() { cd qia/backend && sbt operationalDashboardWebApi/assembly && cd ../../ && COMMIT=$(git rev-parse $1) LOCAL_ALIAS=localhost docker-compose -f ../qia-vm/builder/docker-compose.yml -f ../qia-vm/builder/env-overrides/local.yml -f ../qia-vm/builder/env-overrides/local-api.yml up --force-recreate -d }

function alinityproenv-down() { COMMIT=$(git rev-parse $1) LOCAL_ALIAS=localhost docker-compose -f ../qia-vm/builder/docker-compose.yml down -v }

export PATH="$PATH:~/.bloop"
alias bloop="bloop-ng.py bloop.Cli"
