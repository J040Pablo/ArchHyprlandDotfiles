#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$PATH:$HOME/.npm-global/bin"
export PATH="$HOME/.npm-global/bin:$PATH"
export QT_STYLE_OVERRIDE=kvantumalias unityhub="TMPDIR=/home/pablo/unity-temp unityhub"
