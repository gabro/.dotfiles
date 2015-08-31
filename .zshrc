# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gabro"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gnzh"
# ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew sublime hophop hub npm zsh-syntax-highlighting vi-mode)

setopt vi
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:usr/sbin:/sbin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:$PATH

export CCL_DEFAULT_DIRECTORY=/Users/gabro/UIC/Projects/clicl/ccl

export EDITOR=vim

alias ll='ls -lh'
alias l='ls -lah'

alias gd='git diff --color-words'
alias gds='git diff --staged --color-words'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%C(yellow)(%an, %C(white)%ar)"'
alias gw='git-working-history'
alias gstat='git diff --stat `git hash-object -t tree /dev/null` | tail -1'
alias playstore='java -jar ~/UIC/Thesis/google-play-crawler/googleplay/googleplaycrawler-0.3.jar --conf ~/UIC/Thesis/google-play-crawler/googleplay/crawler.conf'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### SML
export PATH="$PATH:/usr/local/smlnj-110.75/bin"

### NPM
export PATH="$PATH:/usr/local/bin"

### Mine
export PATH=~/bin:$PATH

### Enju
export PATH=$PATH:~/bin/enju-2.4.2

### Android
export PATH=$PATH:/Applications/Android\ SDK/sdk/build-tools/android-4.3

### RVM
PATH=$PATH:$HOME/.rvm/bin

### Cabal
PATH=~/Library/Haskell/bin:$PATH

### NVM
source $(brew --prefix nvm)/nvm.sh

alias sqlplus="DYLD_LIBRARY_PATH='/Users/gabro/Downloads/oracle/' rlwrap /Users/gabro/Downloads/oracle/sqlplus"

### nvbn/thefuck
alias fuck='$(thefuck $(fc -ln -1))'

### alias git to hub
eval "$(hub alias -s)"

### git new-workdir
PATH=$PATH:/usr/local/share/git-core/contrib/workdir
