# bash-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

alias ls='ls -G'
alias ll='ls -laG'
alias grep='grep --color'

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
	return
fi

PS1='\u@macbook:\W \$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
	update_terminal_cwd() {
		# Identify the directory using a "file:" scheme URL,
		# including the host name to disambiguate local vs.
		# remote connections. Percent-escape spaces.
		local SEARCH=' '
		local REPLACE='%20'
		local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
		printf '\e]7;%s\a' "$PWD_URL"
	}
	PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi

function ip {
	ifconfig -a inet	
}

export HISTSIZE=10000
alias weather='curl -4 wttr.in/Yekaterinburg'
alias twitter='cd ~/git/_twitter/'
export LC_CTYPE=ru_RU.UTF-8
