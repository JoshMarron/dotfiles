# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias tmux='tmux -u -2'
alias gau='git add -u'
alias gaa='git add -A'
alias gst='git status'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PATH="$PATH:~/.local/bin"

# Let's generate a PS1
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"
    PS1=""
    
    local RCol='\[\e[0m\]' # Reset colour

    # No prefix: Regular
    # B:         Bold
    # U:         Underline
    # I:         High Intensity
    # BI:        Bold High Intensity
    # On_:       Background
    # On_I:      High Intensity Background

    local Bla='\[\e[0;30m\]'; 
    local BBla='\[\e[1;30m\]'; 
    local UBla='\[\e[4;30m\]'; 
    local IBla='\[\e[0;90m\]'; 
    local BIBla='\[\e[1;90m\]'; 
    local On_Bla='\e[40m'; 
    local On_IBla='\[\e[0;100m\]';

    local Red='\[\e[0;31m\]'; 
    local BRed='\[\e[1;31m\]'; 
    local URed='\[\e[4;31m\]'; 
    local IRed='\[\e[0;91m\]'; 
    local BIRed='\[\e[1;91m\]'; 
    local On_Red='\e[41m'; 
    local On_IRed='\[\e[0;101m\]';

    local Gre='\[\e[0;32m\]'; 
    local BGre='\[\e[1;32m\]'; 
    local UGre='\[\e[4;32m\]'; 
    local IGre='\[\e[0;92m\]'; 
    local BIGre='\[\e[1;92m\]'; 
    local On_Gre='\e[42m'; 
    local On_IGre='\[\e[0;102m\]';

    local Yel='\[\e[0;33m\]'; 
    local BYel='\[\e[1;33m\]'; 
    local UYel='\[\e[4;33m\]'; 
    local IYel='\[\e[0;93m\]'; 
    local BIYel='\[\e[1;93m\]'; 
    local On_Yel='\e[43m'; 
    local On_IYel='\[\e[0;103m\]';

    local Blu='\[\e[0;34m\]'; 
    local BBlu='\[\e[1;34m\]'; 
    local UBlu='\[\e[4;34m\]'; 
    local IBlu='\[\e[0;94m\]'; 
    local BIBlu='\[\e[1;94m\]'; 
    local On_Blu='\e[44m'; 
    local On_IBlu='\[\e[0;104m\]';

    local Pur='\[\e[0;35m\]'; 
    local BPur='\[\e[1;35m\]'; 
    local UPur='\[\e[4;35m\]'; 
    local IPur='\[\e[0;95m\]'; 
    local BIPur='\[\e[1;95m\]'; 
    local On_Pur='\e[45m'; 
    local On_IPur='\[\e[0;105m\]';

    local Cya='\[\e[0;36m\]'; 
    local BCya='\[\e[1;36m\]'; 
    local UCya='\[\e[4;36m\]'; 
    local ICya='\[\e[0;96m\]'; 
    local BICya='\[\e[1;96m\]'; 
    local On_Cya='\e[46m'; 
    local On_ICya='\[\e[0;106m\]';

    local Whi='\[\e[0;37m\]'; 
    local BWhi='\[\e[1;37m\]'; 
    local UWhi='\[\e[4;37m\]'; 
    local IWhi='\[\e[0;97m\]'; 
    local BIWhi='\[\e[1;97m\]'; 
    local On_Whi='\e[47m'; 
    local On_IWhi='\[\e[0;107m\]';

    local PSCol=""
    if [ $HOSTNAME == 'Thrusters' ]; then
        local PSCol="${BBlu}"
    else
        local PSCol="${Pur}"
    fi
    
    local PSEndCol=""
    if [ $EXIT == 0 ]; then 
        local PSEndCol="${IGre}"
        PS1+="[${Gre}:)${RCol}] "
    else 
        local PSEndCol="${IRed}"
        PS1+="[${IRed}${On_Yel}${EXIT}${RCol}] "
    fi

    PS1+="${BGre}\u${RCol}${BPur}@${RCol}${PSCol}\h${RCol}"
    
    PS1+="${Yel}:\w${RCol}"

	if [[ $(command -v git) ]]; then
			local GStat="$(git status --porcelain -b 2>/dev/null | tr '\n' ':')"

			if [ "$GStat" ]; then
				### Fetch Time Check ### {{{
				local LAST=$(stat -c %Y $(git rev-parse --git-dir 2>/dev/null)/FETCH_HEAD 2>/dev/null)
				if [ "${LAST}" ]; then
					local TIME=$(echo $(date +"%s") - ${LAST} | bc)
					## Check if more than 60 minutes since last
					if [ "${TIME}" -gt "3600" ]; then
						git fetch 2>/dev/null
						## Refresh var
						local GStat="$(git status --porcelain -b 2>/dev/null | tr '\n' ':')"
					fi
				fi
				### End Fetch Check ### }}}

				### Test For Changes ### {{{
				## Change this to test for 'ahead' or 'behind'!
				local GChanges="$(echo ${GStat} | tr ':' '\n' | grep -v "^$" | grep -v "^\#\#" | wc -l | tr -d ' ')"
				if [ "$GChanges" == "0" ]; then
					local GitCol=$Gre
				  else
					local GitCol=$Red
				fi
				### End Test Changes ### }}}

				### Find Branch ### {{{
                local GBra="`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`"
				if [ "$GBra" ]; then
					if [ "$GBra" == "master" ]; then
						local GBra="master"      ## Because why waste space
					fi
				  else
					local GBra="ERROR"      ## It could happen supposedly?
				fi
                local GBra=$(echo -e "${GBra}" | tr -d '[:space:]')
				### End Branch ### }}}
				PS1+=":${GitCol}<$GBra>${RCol}"	## Add result to prompt
				### End Commit Status ### }}}
			fi
		  else
			MISSING_ITEMS+="git-prompt, "
		fi
        ### End Git Status ### }}}

        PS1+=" ${PSEndCol}\$${RCol} "
}
