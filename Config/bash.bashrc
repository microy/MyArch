# System-wide .bashrc file for interactive bash(1) shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines in the history.
# Force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# History length
HISTSIZE=10000
HISTFILESIZE=20000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# Arch : [[ $DISPLAY ]] && shopt -s checkwinsize
shopt -s checkwinsize

# Highlight the user name when logged in as root.
if [ "${USER}" = "root" ];
then user_style="\[\e[1;31m\]";
else user_style="\[\e[1;32m\]";
fi;

# Highlight the hostname when connected via SSH.
if [ -n "${SSH_TTY}" ];
then host_style="\[\e[1;31m\]";
else host_style="\[\e[1;32m\]";
fi;

# Fancy prompt
reset_style="\[\e[m\]";
path_style="\[\e[1;36m\]";
PS1="\n╭╴( ${user_style}\u${reset_style} @ ${host_style}\h${reset_style} ) - [ ${path_style}\w${reset_style} ]\n╰╴\\$ ";
unset user_style host_style reset_style path_style

# Arch
case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')

    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

# Enable bash completion
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
	. /usr/share/bash-completion/bash_completion
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Do not bell on tab-completion
bind "set bell-style none"

# Aliases
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -lv'
alias la='ll -A'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C --dirsfirst'
alias ssh-nokey='ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null'
alias du='du -h --max-depth=1'
alias df='df -h'

# Colored IP command
export COLORFGBG=';0'
alias ip='ip -color'
