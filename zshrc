# Set a default shell prompt:
#PS1='`hostname`:`pwd`# '
if [ "$SHELL" = "/bin/pdksh" ]; then
 PS1='! $ '
elif [ "$SHELL" = "/bin/ksh" ]; then
 PS1='! ${PWD/#$HOME/~}$ '
elif [ "$SHELL" = "/bin/zsh" ]; then
 PS1='%n@%m:%~%# '
elif [ "$SHELL" = "/bin/ash" ]; then
 PS1='$ '
else
 PS1='\u@\h:\w\$ '
fi
PS2='> '
export PS1 PS2

bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
