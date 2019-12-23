# some ls aliases
alias lg='ls -lahF --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='la -CF'

alias weeknumber="date +%V"

alias tiga="tig --all"

# some exa aliases
alias es="exa"
alias el="exa --long --group --header --sort=type --icons"
alias ea="exa --all --long --group --header --sort=type --icons"
alias et="exa --all --long --group --header --tree --level=2 --sort=type"
alias eg="exa --all --long --group --header --git --sort=type --icons"

# make python 3 the default if it is installed
## Use ~/bin/env_python3 instead as it works for the path also
# type python3 >/dev/null 2&>1 && alias python=python3

# take() function from oh my zsh
# github.com/robbyrussell/oh-my-zsh/master/lib/functions.zsh
function take() {
	mkdir -p $@ && cd ${@:$#}
}

