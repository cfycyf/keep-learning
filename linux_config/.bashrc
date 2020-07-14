#some color define
BLACK='\[\e[30m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
MAGENTA='\[\e[35m\]'
CYAN='\[\e[36m\]'
WHITE='\[\e[37m\]'
NORMAL='\[\e[0m\]'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# change terminal type to support 256 colors
# [ "x$TERM" = "xxterm" -a -e /usr/share/terminfo/x/xterm-256color ] && TERM='xterm-256color'
[ "$TERM" = "xterm" ] && TERM='xterm-256color'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
*256color)
    if [ "x$UID" != "x0" ]; then
        PS1="${GREEN}[${CYAN}\u${GREEN}]:${GREEN}\${YELLOW}\W${GREEN}\$ ${NORMAL}"
    else
        PS1="${GREEN}[${RED}\u@\h ${YELLOW}\W${GREEN}]\$ ${NORMAL}"
    fi
    ;;
*)
    PS1='[\u@\H \W]\$ '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# display man infor colorful
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export GROFF_NO_SGR=yes

#undefine color
unset BLACK
unset RED
unset GREEN
unset YELLOW
unset BLUE
unset MAGENTA
unset CYAN
unset WHITE
unset NORMAL

# ls colors
#eval `dircolors ~/.dir_colors`

# alias
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto 2>/dev/null'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

PATH=$PATH:$HOME/bin
alias mtags='ctags -f '~/tags' -R `pwd`'
alias orbi_maintrunk_send_email="git send-email --to orbi-maintrunk@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias wap581_send_email="git send-email --to wap581@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias rbs50y_send_email="git send-email --to rbs50y@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias torrey_pines_send_email="git send-email --to torrey-pines@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias src60_send_email="git send-email --to src60@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias srk160_send_email="git send-email --to srk160@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias pro_send_email="git send-email --to business-orbi@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias pro_maintrunk_send_email="git send-email --to orbi-pro-maintrunk@dniserver.dnish.net --smtp-server dniserver.dnish.net"
alias ..="cd ../../"
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias rm="rm -fr"
alias gs="git status"
alias gb="git branch"
alias gf="git fetch"
alias ga="git add"
GIT_HOME="/home/chen.yf/seven/git_home"

