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
