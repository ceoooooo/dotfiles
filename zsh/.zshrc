export PATH="/usr/local/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go
# themes
ZSH_THEME="spaceship"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  deno
  git
  docker
  kubectl
  zsh-autosuggestions
  web-search
  history
  jsontools
  zsh-syntax-highlighting
  fzf-zsh-plugin
)

source $ZSH/oh-my-zsh.sh
source $HOME/.fzf.zsh

export EDITOR='nvim'

export FZF_TMUX=1
export FZF_COMPLETION_TRIGGER='``'
export FZF_DEFAULT_COMMAND='find . -type f'

alias ls="exa -l --git"
export PATH="/opt/homebrew/bin:$PATH"
SPACESHIP_TIME_SHOW=true

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export PATH=$HOME/Library/Python/3.9/bin:${PATH}

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
export optflags="-Wno-error=implicit-function-declaration"

######FZF function
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# branch searrch and checkout
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

#########DOCKER#######

# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# [[ $TMUX != "" ]] && rvm use default > /dev/null 2>&1
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
