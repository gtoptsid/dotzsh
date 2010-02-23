# /etc/zshrc: Το παρόν αρχείο διαβάζεται μόνο σε περίπτωση διαδραστικού
# κέλυφους οπότε μπορεί να περιέχει και εντολές που παράγουν έξοδο

# vim:filetype=zsh:foldmethod=marker
################################################################
# Ο κάθε marker ανοίγει με zo και κλείνει με zc. Το zR ανοίγει #
# όλους τους markers ταυτόχρονα ενώ το zM τους κλείνει.        #
################################################################

# Δήλωση του prompt {{{

# Το κλασσικό prompt:
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

# Δήλωση μεταβλητών {{{
# Οι παρακάτω μεταβλητές έχουν νόημα μόνο σε διαδραστικά κελύφη οπότε
# δηλώνονται εδώ

# Έλεγχος νέων e-mail κάθε 300 δευτερόλεπτα
export MAILCHECK=300

# Μετά από 900 δευτερόλεπτα αδράνειας το κέλυφος δέχεται σήμα ALRM. Αν το
# σήμα δεν έχει γίνει TRAP τότε θα αποσυνδέσει τον χρήστη
# TMOUT=900

# Αν ένα πρόγραμμα εκτελείται για μεγαλύτερο χρόνο από 60 δευτερόλεπτα
# θα τυπώνονται στατιστικά για την χρήση cpu του
# export REPORTTIME=60

# Εμφανίζει μήνυμα κάθε 30 δευτερόλεπτα με όσους χρήστες έχουν μπει/βγει
# (όσους έχουν οριστεί στην μεταβλητή watch)
export LOGCHECK=30

# Έλεγχος της εισόδου/εξόδου όλων των άλλων χρηστών
watch=(notme)
# Έλεγχος της εισόδου/εξόδου όλων των χρηστών
# watch=(all)
WATCHFMT='%n %a %l from %M'
# Παράμετροι του watch # {{{
# %n = Το όνομα χρήστη (username)
# %a = Τύπος δράσης (logged on, logged off)
# %l = Το tty στο οποίο συνδέθηκε ο χρήστης
# %M = Το ολοκληρωμένο hostname
# %m = Το hostname μέχρι την πρώτη .
# %U %u = Αρχή/Τέλος υπογραμμισμένου κειμένου
# %B %b = Αρχή/Τέλος κεφαλαίου (bold) κειμένου
# %T = Ώρα σε 24h μορφή
# %W = Ημερομηνία με μορφή mm/dd/yy
# %D = Ημερομηνία με μορφή yy-mm-dd
# }}}

# Όταν έχει δηλωθεί μια συνάρτηση με το όνομα precmd αυτή καλείται πριν να
# εμφανιστεί το prompt. Παρόμοια, η preexec καλείται πριν να εκτελεστεί μια
# εντολή. Οι παρακάτω εντολές εμφανίζουν στον τίτλο του τερματικού τον
# τρέχοντα κατάλογο και την εντολή που εκτελείται αυτή την στιγμή
if [[ $TERM == *xterm* ]]; then
	precmd () {
		print -Pn "\e]0;%n@%m:%~ \a"
	}

	preexec () {
		print -Pn "\e]0;%n@%m:%~ <$1>\a"
	}
fi

# Ορίζει χρώματα στο less για εμφάνιση χρωματιστών manpages
# Ο έλεγχος θα μπορούσε επίσης να επιτευχθεί με την εντολή echoti colors
if [[ $terminfo[colors] -gt 2 ]]; then
	export LESS_TERMCAP_mb=$'\E[01;31m'
	export LESS_TERMCAP_md=$'\E[01;31m'
	export LESS_TERMCAP_me=$'\E[0m'
	export LESS_TERMCAP_se=$'\E[0m'
	#export LESS_TERMCAP_so=$'\E[01;44;33m'
	export LESS_TERMCAP_ue=$'\E[0m'
	export LESS_TERMCAP_us=$'\E[01;32m'
fi

# }}}
