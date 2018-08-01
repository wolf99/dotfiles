
# some ls aliases
alias lg='ls -lahF --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='la -CF'

# python 3 is the default
alias python=python3

# take() function from oh m zsh
# github.com/robbyrussell/oh-my-zsh/master/lib/functions.zsh
function take() {
	mkdir -p $@ && cd ${@:$#}
}

