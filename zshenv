# vim:filetype=zsh:foldmethod=marker
################################################################
# Ο κάθε marker ανοίγει με zo και κλείνει με zc. Το zR ανοίγει #
# όλους τους markers ταυτόχρονα ενώ το zM τους κλείνει.        #
################################################################

# Δήλωση μεταβλητών {{{

export MINICOM="-c on"
export MANPATH=/usr/local/man:/usr/man
export HOSTNAME="`cat /etc/HOSTNAME`"
export LESSOPEN="|lesspipe.sh %s"
export LESS="-M"

# If the user doesn't have a .inputrc, use the one in /etc.
if [ ! -r "$HOME/.inputrc" ]; then
  export INPUTRC=/etc/inputrc
fi

# Μεταβλητή PATH {{{

PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"

# For root users, ensure that /usr/local/sbin, /usr/sbin, and /sbin are in
# the $PATH.  Some means of connection don't add these by default (sshd comes
# to mind).
if [ "`id -u`" = "0" ]; then
  echo $PATH | grep /usr/local/sbin 1> /dev/null 2> /dev/null
  if [ ! $? = 0 ]; then
    PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
  fi
fi

# Append any additional sh scripts found in /etc/profile.d/:
for profile_script in /etc/profile.d/*.sh ; do
  if [ -x $profile_script ]; then
    . $profile_script
  fi
done
unset profile_script

# For non-root users, add the current directory to the search path:
if [ ! "`id -u`" = "0" ]; then
 PATH="$PATH:."
fi

# }}}

# Set TERM to linux for unknown type or unset variable:
if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
 TERM=linux
fi

# Set ksh93 visual editing mode:
if [ "$SHELL" = "/bin/ksh" ]; then
  VISUAL=emacs
#  VISUAL=gmacs
#  VISUAL=vi
fi

export PATH DISPLAY TERM

# }}}

# umask {{{

# Default umask.  A umask of 022 prevents new files from being created group
# and world writable.
umask 022

# }}}
