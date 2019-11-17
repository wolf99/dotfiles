# some ls aliases
alias lg='ls -lahF --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='la -CF'

alias weeknumber="date +%V"

alias tiga="tig --all"

# some exa aliases
alias el="exa --long --group --header"
alias ea="exa --all --long --group --header"
alias et="exa --all --long --group --header --tree --level=2"
alias eg="exa --all --long --group --header --git"

# python 3 is the default
alias python=python3

# take() function from oh m zsh
# github.com/robbyrussell/oh-my-zsh/master/lib/functions.zsh
function take() {
	mkdir -p $@ && cd ${@:$#}
}

