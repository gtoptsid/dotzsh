# vim:filetype=zsh:foldmethod=marker
################################################################
# Ο κάθε marker ανοίγει με zo και κλείνει με zc. Το zR ανοίγει #
# όλους τους markers ταυτόχρονα ενώ το zM τους κλείνει.        #
################################################################

# Δήλωση του prompt {{{

# Set a default shell prompt:
PS1='%n@%m:%~%# '
PS2='> '
export PS1 PS2

# }}}

# Λειτουργίες πλήκτρων {{{

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

# }}}
