alias ls='ls --color=auto'
alias dns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias k='kubectl'
alias xargs='xargs '
alias fix_brackets="printf '\e[?2004l'"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export PATH=~/Library/Python/3.9/bin:$PATH
export TERM=xterm-256color

source ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -f ~/.bashrc ]] && . ~/.bashrc # ghcup-env