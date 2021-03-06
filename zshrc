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

# Παράμετροι του prompt # {{{
# %% = %
# %) = )
# %l = tty
# %M = full hostname
# %m = hostname
# %n = username
# %# = # για τον root, % για απλό χρήστη
# %? = η κατάσταση της προηγούμενης εντολής
# %_ = η κατάσταση του parser (χρησιμεύει στο PS2)
# %d ή %/ = τρέχων κατάλογος
# %~ = τρέχων κατάλογος αλλά με εμφάνιση των δηλωμένων καταλόγων πχ $HOME=~
# %h ή %! = ο αριθμός της εντολής στο ιστορικό
# %j = ο αριθμός των εργασιών που εκτελούνται στο παρασκήνιο
# %L = η τρέχουσα τιμή του $SHLVL
# %D = ημερομηνία με μορφή yy-mm-dd
# %W = ημερομηνία με μορφή mm/dd/yy
# %T = ώρα με 24ωρη μορφή
# %* = ^ ^ ^  με εμφάνιση δευτερολέπτων
# %D{string} = ημερομηνία με μορφή δικής μας επιλογής (με βάση την strftime)
#              π.χ %D{%d/%m/%y} = ημερομηνία με μορφή ηη/μμ/χχ
# %B %b = Εκκίνηση/Τερματισμός τονισμού
# %U %u = Εκκίνηση/Τερματισμός υπογράμμισης
# %F %f = Εκκίνηση/Τερματισμός χρώματος του προσκήνιου π.χ %F{red}
# %K %k = ^ ^ ^ για παρασκήνιο
# %{ %} = Το περιεχόμενο δεν απαιτεί χώρο οπότε δεν αλλάζει τη τιμή του κέρσορα
# }}}

# }}}

# Λειτουργίες πλήκτρων {{{

# Η επιλογή του keymap γίνεται αυτόματα με βάση την μεταβλητή VISUAL
# Εδώ δηλώνουμε χειροκίνητα ότι επιθυμούμε πλήκτρα με βάση τον emacs
bindkey -e

# Home/End linux console
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
# Home/End rxvt
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
# Home/End BSD
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# Home/End xterm
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# Insert/Delete
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
# Page Up/Down
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history

# Ctrl + Left/Right Arrow = Μετακίνηση μια λέξη αριστερά/δεξιά
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

# Ctrl + Up/Down Arrow = Προηγούμενη/Επόμενη καταχώρηση ιστορικού
# Τα Πάνω/Κάτω βέλη είναι συνδεδεμένα με τα up/down-line-or-history δηλαδή
# όταν υπάρχει μια γραμμή στην γραμμή εντολών εμφανίζουν καταχωρήσεις στο
# ιστορικό και όταν υπάρχουν πολλές γραμμές (π.χ for) μετακινούνται μέσα
# στις γραμμές. Μερικές φορές όμως αυτή η λειτουργία είναι ενοχλητική
# οπότε με ctrl + Πάνω/Κάτω βέλος αλλάζουμε γρήγορα καταχώρηση στο ιστορικό
bindkey "\e[1;5A" up-history
bindkey "\e[1;5B" down-history

# Ctrl + Delete = Σβήνει μια λέξη αντί για ένα χαρακτήρα
bindkey "\e[3;5~" delete-word
# Shift + Delete = Σβήνει μια λέξη προς τα πίσω (ίδιο με Ctrl+W)
bindkey "\e[3;2~" backward-delete-word
# Ctrl + Insert = Αντιγράφει την προηγούμενη λέξη στην γραμμή εντολών
# bindkey "\e[2;5~" copy-prev-word
# Ctrl + Insert = Αντιγράφει την προηγούμενη λέξη στην γραμμή εντολών (όπου
# λέξη δεν θεωρείται με βάση τα κενά αλλά επιλέγει ο parser)
# Χρήσιμη για γρήγορες αλλαγές ονόματος π.χ mv Hello World.c <ctrl+insert>
# μετατρέπεται σε mv Hello World.c Hello World.c οπότε μπορεί εύκολα να
# αλλαχθεί το δεύτερο όνομα
bindkey "\e[2;5~" copy-prev-shell-word

# Για να λειτουργήσει ο συμπληρωτής _expand δεν πρέπει να γίνεται επέκταση
# σε προηγούμενο στάδιο οπότε αλλάζουμε την συσχέτιση του TAB από
# expand-or-complete σε complete-word
# bindkey "^i" complete-word
bindkey "^i" expand-or-complete-prefix

# }}}

# Δήλωση μεταβλητών {{{
# Οι παρακάτω μεταβλητές έχουν νόημα μόνο σε διαδραστικά κελύφη οπότε
# δηλώνονται εδώ

# Αποτροπή κολλήματος συστημάτων με οδηγό nvidia
export VDPAU_NVIDIA_NO_OVERLAY=1

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

unset GPG_AGENT_INFO
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi

GPG_TTY=$(tty)
export GPG_TTY

if [[ $EUID != 0 ]]; then
	if [ -x "$(which gpg-connect-agent)" ]; then
		gpg-connect-agent updatestartuptty /bye >& /dev/null
	fi
fi

# }}}

# Δήλωση συντομεύσεων (aliases) # {{{

# Εμφάνιση μόνο καταλόγων που αρχίζουν με .
alias lsdd='ls -d .*(/)'
# Εμφάνιση μόνο αρχείων που αρχίζουν με .
alias lsdf='ls -a .*(.)'
# Εμφάνιση μόνο καταλόγων
alias lsd='ls -d *(/)'
# Εμφάνιση μόνο άδειων καταλόγων (για rmdir)
alias lsed='ls -d *(/^F)'
# Εμφάνιση όλων των setgid/setuid/sticky αρχείων του καταλόγου
alias lssuid='ls -l *(s,S,t)'

# Δημιουργία καταλόγου και αλλαγή σε αυτόν
mkcd () {
	mkdir -p "$*"
	cd "$*"
}

# Επαναυπολογισμός του $TERMCAP ώστε να ληφθούν υπόψην οι καινούριες
# διαστάσεις ενός τερματικού (μετά από αλλαγή μεγέθους)
alias rsz='eval $(resize)'

# Δήλωση γενικών συντομεύσεων. Η διαφορά τους είναι ότι υφίστανται επέκταση
# σε οποιοδήποτε σημείο της εντολής. π.χ ls WC ισοδυναμεί με ls|wc -l
alias -g DN=/dev/null
alias -g WC="|wc -l"
alias -g G="|grep"
alias -g L="|less"
alias -g S="|sort"

# Βολικές συσχετίσεις επεκτάσεων
# π.χ % arxeio.pdf ισοδυναμεί με okular arxeio.pdf
alias -s tar.bz2="tar jxvf"
alias -s tar.gz="tar zxvf"
alias -s rar="rar x"
alias -s pdf=okular
alias -s ps=gv
alias -s {avi,mpg,MPG,mkv,wmv,mp3,ogg}=mplayer

# }}}

# Δήλωση ψευδωνύμων καταλόγων (named directories) # {{{

# % cd ~T ισοδυναμεί με % cd ~/torrents/done
# Αν είναι ενεργοποιημένο το cdable_vars τότε θα λειτουργεί και το % cd T
# Αν είναι ενεργοποιημένο και το auto_cd τότε θα λειτουργεί και το % T
hash -d T=~/torrents/done
hash -d I=~/.aMule/Incoming
hash -d G=/home/git/repos
hash -d M=/home/git/mine
hash -d log=/var/log
hash -d pac=/var/log/packages

# }}}

# Φόρτωμα συναρτήσεων του Zsh # {{{

# Υπό κανονικές συνθήκες το run-help είναι alias στο man το οποίο όμως
# προκαλεί προβλήματα όταν ζητηθεί μια ενσωματωμένη στο zsh εντολή γιατί το
# man δεν την γνωρίζει, έτσι χρησιμοποιούμε την wrapper συνάρτηση run-help
# που παρέχει το zsh
# Esc-h δίνει την manpage της εντολής που υπάρχει στην γραμμή εντολών
[[ $(whence -w run-help) == *alias ]] && unalias run-help
autoload -Uz run-help

# Μετονομάζει αρχεία όπως η εντολή rename όμως χρησιμοποιεί τα patterns
# και τους modifiers του zsh έτσι έχει πολύ περισσότερη δύναμη
# autoload -U zmv

# Εμφανίζει χρήσιμες πληροφορίες για repositories
autoload -Uz vcs_info
# Εκτός από την ήδη δηλωμένη precmd() θα εκτελούνται και οι συναρτήσεις
# που ορίζονται στο array δηλαδή η vcs_info
precmd_functions=(vcs_info)
# }}}

# Προγραμματιζόμενη συμπλήρωση # {{{

# Φόρτωμα και εκκίνηση της προγραμματιζόμενης συμπλήρωσης και του complist
# για να έχουμε χρώματα
zmodload zsh/complist
autoload -Uz compinit
compinit

# Η συμπλήρωση θα εμφανίζει τα αποτελέσματα με χρώμα ανάλογο του τύπου τους.
# Τα χρώματα που θα χρησιμοποιηθούν θα είναι τα ίδια με της εντολής ls
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Απενεργοποίηση του παλαιού τρόπου συμπλήρωσης
zstyle ':completion:*' use-compctl false

# zstyle ':completion:<function>:<completer>:<command>:<args>:<tag>'

# Η συμπλήρωση γίνεται πιο περιγραφική
zstyle ':completion:*' verbose true
# Κατά την συμπλήρωση παραμέτρων εμφανίζεται και η περιγραφή τους
zstyle ':completion:*:options' description true
# Αν η συμπλήρωση δεν έχει αποτελέσματα εμφανίζει ενημερωτικό μήνυμα
zstyle ':completion:*:warnings' format 'Δεν βρέθηκε %d'
# Εμφανίζει τι είδους συμπλήρωση επιχειρείται
zstyle ':completion:*:descriptions' format 'Συμπληρώνεται %d'
# Χωρίζει τα αποτελέσματα με βάση τα tags τους
zstyle ':completion:*' group-name ''
# Ο χωρισμός γίνεται με την παρακάτω σειρά
zstyle ':completion:*' group-order builtins functions commands
# Η συμπλήρωση των συναρτήσεων θα αγνοεί ό,τι αρχείο αρχίζει από _
# έτσι δεν θα εμφανίζονται οι εσωτερικές συναρτήσεις συμπλήρωσης του zsh.
# Για να γίνει αυτό δεν πρέπει να χρησιμοποιείται ο συμπληρωτής _ignored.
zstyle ':completion:*:functions' ignored-patterns '_*'

# Ταξινομεί τα αποτελέσματα με βάση το όνομά τους
# zstyle ':completion:*' file-sort name
# Ενεργοποίηση της συμπλήρωσης μενού για αριθμό αποτελεσμάτων > 10
# zstyle ':completion:*' menu select=10
# Ενεργοποίηση της συμπλήρωσης μενού για αριθμό αποτελεσμάτων > μία οθόνη
# zstyle ':completion:*' menu select=long

# Ενεργοποίηση συγκεκριμένων συμπληρωτών
# _expand  : Πραγματοποιεί επέκταση όπως γίνεται με το TAB. Πρέπει να δηλωθεί
#            πριν τον _complete και να αλλαχθεί το keybinding του TAB ώστε να
#            μην γίνεται επέκταση σε εκείνο το στάδιο
# _complete: Ο κύριος συμπληρωτής
# _prefix  : Συμπληρώνει μέσα στις λέξεις όπως το bash (για να λειτουργήσει
#            πρέπει να είναι ενεργοποιημένο το complete_in_word)
# _correct : Επιχειρεί συμπλήρωση προσπαθώντας διάφορες διορθώσεις
# _ignored : Λαμβάνει υπόψην τα μέχρι πριν αγνοηθέντα patterns
# _files   : Επιχειρεί συμπλήρωση αρχείων. Συνήθως χρησιμοποιείται ως
#            τελευταία λύση σε περίπτωση που αποτύχει η έξυπνη συμπλήρωση
zstyle ':completion:*' completer _complete _prefix _files

# Η συμπλήρωση της εντολής cd δεν θα λαμβάνει υπόψην τον τρέχοντα κατάλογο
# (εκτέλεση του cd ../<TAB> μέσα στον κατάλογο /usr δεν θα εμφανίσει τον /usr)
# και τους γονικούς καταλόγους (εκτέλεση του cd foo/../<TAB> δεν θα εμφανίσει
# τον foo)
zstyle ':completion:*:*:cd:*' ignore-parents pwd parent

# Αν ένα αρχείο βρίσκεται ήδη στη γραμμή εντολών τότε να μην εμφανίζεται
# σαν πρόταση από τη συμπλήρωση
zstyle ':completion:*:*:(cp|mv|rm):*' ignore-line other

# Εφόσον τα αρχεία αντικειμένων (.o) και βιβλιοθηκών (.a και .so*) δεν είναι
# αρχεία κειμένου εξαιρούνται από την εμφάνιση στην συμπλήρωση κειμενογράφων.
zstyle ':completion:*:*:(vi|less|more):*' ignored-patterns '*.(o|a|so*)'

# Ενεργοποίηση του μενού στην συμπλήρωση της εντολής kill για ευκολία
zstyle ':completion:*:*:kill:*' menu yes select
# Εμφάνιση λίστας ακόμη και όταν δεν χρειάζεται
zstyle ':completion:*:*:kill:*' force-list always
# Εμφάνιση όλων των διεργασιών του χρήστη (Κανονικά η συμπλήρωση της εντολής
# kill εμφανίζει μόνο διεργασίες του τρέχοντος κελύφους)
zstyle ':completion:*:*:kill:*' command 'ps -u $USER -o pid,ppid,tname,args'
# Χρήση κόκκινου χρώματος στο PID για εύκολη ανάγνωση
# Επεξήγηση του pattern {{{
# "(#b)" = Ενεργοποίηση των backreferences.
# " #" = Εύρεση μηδενός ή περισσότερων κενών
# "([0-9]#)" = Εύρεση ψηφίων και αποθήκευση τους
# * = Εύρεση όλων των υπολοίπων χαρακτήρων
# "=0=01;31" = Μη χρήση χρώματος (=0) για το pattern εκτός από αυτό που
# αποθηκεύτηκε το οποίο εμφανίζεται κόκκινο (=01;31)
# }}}
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Το zsh χρησιμοποιεί τα αρχεία /etc/hosts και known_hosts του ssh για
# συμπλήρωση hostnames. Μπορούμε όμως να παρακάμψουμε αυτή τη λειτουργία
# και να δηλώσουμε χειροκίνητα τα hostnames που θέλουμε.

# Δήλωση hostnames τα οποία θα χρησιμοποιούνται από οποιαδήποτε δικτυακή
# εντολή (π.χ ping,nslookup,telnet,ssh)
# myhosts=(hostname1 hostname2 hostname3)
# zstyle ':completion:*:hosts' hosts $myhosts

# Δήλωση usernames-hostnames τα οποία θα χρησιμοποιούνται από την εντολή ssh.
# Σε περίπτωση που δηλωθεί παρακάμπτει για το ssh την hosts
# myaccounts=(user1:host1 user2@host2)
# zstyle ':completion:*:my-accounts' users-hosts $myaccounts

# Αγνόηση των δαιμόνων κατά την συμπλήρωση ονομάτων χρηστών εκτός
# από την περίπτωση της εντολής chmod
zstyle ':completion:*:*:(^chown):*:users' ignored-patterns adm apache bin \
	daemon ftp games gdm haldaemon halt lp mail messagebus mysql news \
	nobody operator oprofile pop rpc shutdown smmsp sshd sync uucp

# Εμφάνιση του branch και της διεργασίας (πχ rebase) που εκτελείται καθώς
# και πιθανών αλλαγών που υπάρχουν.
zstyle ':vcs_info:*' actionformats '[%b|%a%c%u]'
zstyle ':vcs_info:*' formats '[%b%c%u]'
# Το string που θα εμφανίζεται όταν υπάρχουν unstaged αλλαγές (που δεν έχουν
# ενωσματωθεί στο index με 'git add')
zstyle ':vcs_info:*' unstagedstr ' U'
# Το string που θα εμφανίζεται όταν υπάρχουν staged αλλαγές (που έχουν
# ενωσματωθεί στο index με 'git add' αλλά δεν έχει γίνει commit)
zstyle ':vcs_info:*' stagedstr ' S'
# Θα γίνεται έλεγχος για αλλαγές (Κανονικά είναι απενεργοποιημένη γιατί σε
# μεγάλα αποθετήρια μπορεί να χρειάζεται χρόνο για να λειτουργήσει. Χωρίς
# αυτήν δεν θα εμφανίζονται οι αλλαγές ακόμα και αν έχουν δηλωθεί στο formats
zstyle ':vcs_info:*' check-for-changes true
# Ενεργοποίηση μόνο της υποστήριξης για το git
zstyle ':vcs_info:*' enable git
# Εμφάνιση των πληροφοριών για τα αποθετήρια στη δεξιά πλευρά
RPROMPT='${vcs_info_msg_0_}'

# }}}

# Χρήσιμες συναρτήσεις # {{{

# Αναβάθμιση πολλών repositories ταυτόχρονα
pull()
{
	while [[ -d $1 ]]; do
		echo Processing $1
		cd $1
		if [[ $(git rev-parse --is-bare-repository 2>/dev/null) == "true" ]]; then
			git fetch --all
			GBRANCH=$(git symbolic-ref --short -q HEAD)
			if [ $? != 0 ]; then
				break
			fi

			git diff --stat --summary -M ${GBRANCH}..origin/${GBRANCH}
			rm -f ORIG_HEAD
			if git rev-parse --verify HEAD > /dev/null; then
				git rev-parse --verify HEAD > ORIG_HEAD
			fi
			git update-ref refs/heads/${GBRANCH} refs/remotes/origin/${GBRANCH}
			unset GBRANCH
		elif [[ -d .git ]]; then
			git pull --all
		elif [[ -d .svn ]]; then
			svnversion
			svn up
		else
			# Ίσως υπάρχουν υποκατάλογοι με αποθετήρια
			pull *(/)
		fi
		cd ..
		shift
	done 2>&1 |less -r
}

# Δημιουργία συμβολικών συντομεύσεων για χρήση με το slackroll
slup()
{
	SLACKROLL_DIR=/var/slackroll
	MIRROR_DIR=/home/ftp/slackware64-current

	(
	cd $SLACKROLL_DIR
	#rm -f packages/*
	for lnk in packages/*; do
		if [[ ! -e $lnk ]]; then
			rm $lnk
		fi
	done

	slackroll update
	for pkg in $( slackroll remote-paths ); do
		# if [[ -e $MIRROR_DIR/$pkg ]]; then
		if [[ -e $MIRROR_DIR/$pkg && ! -e packages/$pkg:t ]]; then
			ln -s $MIRROR_DIR/$pkg ./packages
		fi
	done
	unset SLACKROLL_DIR MIRROR_DIR pkg lnk
	)
}

# }}}
