# inspired by http://github.com/sapegin/dotfiles

# colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

# user color
case $(id -u) in 
	0) user_color="$RED" ;; # root
	*) user_color="$GREEN" ;;
esac
#user_color="$GREEN"

local_username="toby"

# symbols
prompt_symbol="❯"
prompt_clean_symbol=""
prompt_dirty_symbol="☂"
#prompt_venv_symbol="☁"

function prompt_command() {
	# local or SSH session?
	local remote=
	[ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && remote=1

	# git branch name and work tree status (only when we are inside Git working tree
	local git_prompt=""
	if [[ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
		# branch name
		local branch="$(git symbolic-ref HEAD 2>/dev/null)"
		branch="${branch##refs/heads/}"
		# working tree status (red when dirty)
		local dirty=
		# modified files
		git diff --no-ext-diff --quiet --exit-code --ignore-submodules 2>/dev/null || dirty=1
		# untracked files
		[ -z "$dirty" ] && test -n "$(git status --porcelain)" && dirty=1

		# format git info
		if [ -n "$dirty" ]; then
			git_prompt="$CYAN[$branch]$prompt_dirty_symbol$NOCOLOR"
		else
			git_prompt="$CYAN[$branch]$prompt_clean_symbol$NOCOLOR"
		fi
	fi

	# only show username if not default
	local user_prompt=""
	[ "$USER" != "$local_username" ] && user_prompt="$user_color$USER$NOCOLOR"

	# show hostname inside SSH session
	local host_prompt=
	[ -n "$remote" ] && host_prompt="@$YELLOW$HOSTNAME$NOCOLOR"

	# show delimiter if user or host visible
	local login_delimiter=
	[ -n "$user_prompt" ] || [ -n "$host_prompt" ] && login_delimiter=":"

	# format prompt
	prompt="$user_prompt$host_prompt$login_delimiter$BLUE\w$NOCOLOR$git_prompt"
	# text (commands) inside \[...\] does not impact line length calculation which fixes strange bug when looking through the history
	# $? is a status of last command, should be processed every time prompt prints
	symbol="\`if [ \$? = 0 ]; then echo \[\$CYAN\]; else echo \[\$RED\]; fi\`\[\$WHITE\]\$prompt_symbol\[\$NOCOLOR\] "
	PS1="$prompt$symbol"

	# multiline command
	PS2="\[$CYAN\]$prompt_symbol\[$NOCOLOR\] "
}

# show awesome prompt only if git is installed
command -v git >/dev/null 2>&1 && PROMPT_COMMAND=prompt_command;

