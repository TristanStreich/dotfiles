alias ls='ls --color=auto'
alias dns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias k='kubectl'
alias xargs='xargs '
alias fix_brackets="printf '\e[?2004l'"
send_creds() {
    # $1: hostname to send rsa creds to
    ssh $1 "
        mkdir -p ~/.ssh &&
        cat >> ~/.ssh/authorized_keys
    " < ~/.ssh/id_rsa.pub
}
fwd_k_port(){
	# $1 grep arg for pod
	# ${@:2} all other args are ports
	pod_name=$(kubectl get pods | grep $1 | grep Running | awk '{ print $1 }')
	kubectl port-forward $pod_name ${@:2}
}

set_up_remote(){
    # $1 remote host
    send_creds $1

    # Set up vim
    scp ~/.vimrc $1:~/
    ssh $1 "mkdir -p ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged"
    ssh $1 "vim +PlugInstall +qall"

    # Set up Bash profile
    scp ~/.bash_profile $1:~/
    ssh $1 "source ~/.bash_profile"

    # TODO: set up tmux

    ssh $1
}


export PATH=~/Library/Python/3.9/bin:$PATH
export TERM=xterm-256color

source ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -f ~/.bashrc ]] && . ~/.bashrc # ghcup-env