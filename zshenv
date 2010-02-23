# /etc/zshenv: Το παρόν αρχείο διαβάζεται από όλα τα είδη κελύφους επομένως
# θα πρέπει να έχει μόνο δηλώσεις μεταβλητών και εντολές που δεν παράγουν
# έξοδο γιατί μπορεί να μην υπάρχει tty (π.χ σύνοδος sftp)

# vim:filetype=zsh:foldmethod=marker
################################################################
# Ο κάθε marker ανοίγει με zo και κλείνει με zc. Το zR ανοίγει #
# όλους τους markers ταυτόχρονα ενώ το zM τους κλείνει.        #
################################################################

# Δήλωση μεταβλητών {{{

# Ορίζει σε ποιους καταλόγους θα ψάχνει η εντολή man για manpages
export MANPATH=/usr/local/man:/usr/man
export HOSTNAME="`cat /etc/HOSTNAME`"
export LESSOPEN="|lesspipe.sh %s"
# Αλλάζει την λειτουργία του less ώστε να δίνει περισσότερες πληροφορίες
export LESS="-M"

# Μεταβλητή PATH {{{

# Η μεταβλητή PATH χρησιμοποιείται για την αυτόματη εύρεση προγραμμάτων.
# Στο zsh η μεταβλητή path είναι array και είναι συνδεδεμένη με την PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"

# Προσθέτει καταλόγους που χρειάζονται στον υπερχρήστη
if [ "`id -u`" = "0" ]; then
  echo $PATH | grep /usr/local/sbin 1> /dev/null 2> /dev/null
  if [ ! $? = 0 ]; then
    PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
  fi
fi

# Τα αρχεία στο /etc/profile.d δηλώνουν την μεταβλητή PATH και άλλες
# μεταβλητές οπότε η εισαγωγή τους μπορεί να γίνει εδώ. Αν στο μέλλον
# κάποιο αρχείο παράγει έξοδο τότε το παρόν τμήμα θα πρέπει να μεταφερθεί
# στο zshrc
for profile_script in /etc/profile.d/*.sh ; do
  if [ -x $profile_script ]; then
    . $profile_script
  fi
done
unset profile_script

# Για τον απλό χρήστη, προστίθεται στην PATH ο τρέχων κατάλογος ώστε να μπορεί
# να εκτελεί προγράμματα που βρίσκονται στον κατάλογο του. Για λόγους ασφαλείας
# καλό είναι ο τρέχων κατάλογος να βρίσκεται πάντα στο τέλος της PATH για αυτό
#  και το παρόν τμήμα εκτελείται τελευταίο.
if [ ! "`id -u`" = "0" ]; then
 PATH="$PATH:."
fi

# }}}

# Ορισμός της μεταβλητής TERM επειδή κάποιες φορές αποτυγχάνει ο αυτόματος
# ορισμός της και αυτό δημιουργεί προβλήματα
if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
 TERM=linux
fi

export PATH DISPLAY TERM

# }}}

# umask {{{
# Θέτει την umask σε 022 (rw-r--r--)
umask 022

# }}}
