# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Custom additions

## Set output of GPG (e.g. password prompt) to use CLI
export GPG_TTY=$(tty)

## make the ls directory highlight color nicer
## default for ow (own, writable, no sticky bit) is 34;42
LS_COLORS=$LS_COLORS:'ow=35;40:'
export LS_COLORS

## gradle paths
export GRADLE_HOME=/opt/gradle/gradle-5.3.1
PATH=${GRADLE_HOME}/bin:${PATH}

## remember history even if prompt is closed unusually
#export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

# add python3 to the path
#export PY_PYTHON=3
#PATH=/usr/bin/python3:${PATH}
PATH=~/bin/env_python3:${PATH}

# add julia to the path
PATH=${PATH}:~/bin/julia-1.3.1/bin
