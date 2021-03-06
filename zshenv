# /etc/zshenv: Το παρόν αρχείο διαβάζεται από όλα τα είδη κελύφους επομένως
# θα πρέπει να έχει μόνο δηλώσεις μεταβλητών και εντολές που δεν παράγουν
# έξοδο γιατί μπορεί να μην υπάρχει tty (π.χ σύνοδος sftp)

# vim:filetype=zsh:foldmethod=marker
################################################################
# Ο κάθε marker ανοίγει με zo και κλείνει με zc. Το zR ανοίγει #
# όλους τους markers ταυτόχρονα ενώ το zM τους κλείνει.        #
################################################################

# Δήλωση παραμέτρων συστήματος # {{{

# Δεν θα εκτελεστούν τα /etc/{zprofile,zshrc,zlogin,zlogout}
# unsetopt global_rcs
# Δεν θα εκτελεστεί κανένα αρχείο εκτός από το παρόν /etc/zshenv
# unsetopt rcs

# Οι παράμετροι δηλώνονται στο zshenv ώστε να μπορούν να τις χρησιμοποιήσουν
# και τα αρχεία δέσμης εντολών όμως μπορεί ο χρήστης να μην το επιθυμεί αυτό
# έτσι ορίζονται οι μεταβλητές μόνο αν δεν έχει επιλεχθεί κάποια επιλογή
# από τις norcs και noglobalrcs
if [[ -o rcs && -o globalrcs ]]; then

  # Ενεργοποιεί την αυτόματη αλλαγή καταλόγου, έτσι
  # % /path/to/dir ισοδυναμεί με % cd /path/to/dir
  # setopt auto_cd

  # Αν το όρισμα της cd δεν αντιστοιχεί σε υπάρχοντα κατάλογο, ελέγχει
  # αν έχει οριστεί μεταβλητή με αυτό το όνομα που να αντιστοιχεί σε
  # κατάλογο π.χ % cd T ισοδυναμεί με % cd ~T
  # setopt cdable_vars

  # Απενεργοποιεί την συμπλήρωση μενού και απλά εμφανίζει τις συμπληρώσεις
  # όπως το bash. Με ενεργοποιημένο το AUTO_MENU το δεύτερο TAB εισάγει τις
  # συμπληρώσεις μία μετά την άλλη. Αναιρείται από την MENU_COMPLETE
  # setopt no_auto_menu

  # Απενεργοποιεί την εμφάνιση των πιθανών συμπληρώσεων στο πρώτο TAB
  # setopt no_auto_list

  # Το zsh επιχειρεί συμπλήρωση μόνο στο τέλος της λέξης
  # π.χ ls /ulocal αν ο δρομέας είναι πάνω στο l και πατήσουμε το tab το
  # bash θα επιχειρήσει συμπλήρωση και θα το κάνει /usr/local ενώ το zsh δεν
  # θα κάνει τίποτα. Με ενεργοποιημένο το COMPLETE_IN_WORD, το zsh επιχειρεί
  # συμπληρώσεις μέσα στις λέξεις όπως το bash.
  setopt complete_in_word

  # Ενεργοποιεί την απευθείας συμπλήρωση. Έτσι οι συμπληρώσεις εισάγονται
  # στην γραμμή εντολών από το πρώτο TAB. Αναιρεί την AUTO_MENU
  # setopt menu_complete

  # Απενεργοποιεί την επέκταση αρχείου (filename expansion) με το "=" π.χ
  # % =ls παράγει /bin/ls
  # setopt no_equals

  # Τα #,~,^ χρησιμοποιούνται ως patterns
  # Το ^ δηλώνει αντιστροφή π.χ ^foo δηλώνει τα πάντα εκτός από το foo
  # Το ~ στη μέση της λέξης δηλώνει 'εκτός από' π.χ t*~*.o δηλώνει όλα
  # τα αρχεία που αρχίζουν από t εκτός από αυτά που έχουν επέκταση .o
  # Το # στο τέλος σημαίνει μηδέν ή περισσότερες εμφανίσεις π.χ (foo)#
  # δηλώνει foo,foofoo,foofoofoo κτλ
  setopt extended_glob

  # Πραγματοποιεί επέκταση ονομάτων σε όλες τις = εκφράσεις που δεν
  # περιέχονται σε εισαγωγικά π.χ echo foo=~root εμφανίζει foo=~root κανονικά
  # ενώ με ενεργοποιημένη την MAGIC_EQUAL_SUBST εμφανίζει foot=/root
  setopt magic_equal_subst

  # Όταν ένα pattern για δημιουργία ονομάτων αρχείων δεν έχει αποτέλεσμα
  # κανονικά τυπώνεται μήνυμα λάθους. Απενεργοποίηση αυτής της λειτουργίας
  setopt no_nomatch

  # Καταχωρήσεις που υπάρχουν στο ιστορικό δεν καταχωρούνται ξανά
  # setopt hist_ignore_dups

  # Η καταχώρηση του ιστορικού που επιλέγεται με την επέκταση ιστορικού
  # (history expansion) δεν εκτελείται άμεσα αλλά εμφανίζεται στην γραμμή
  # εντολών για επαλήθευση
  # setopt hist_verify

  # Η ανακατεύθυνση εξόδου > δεν σβήνει τα υπάρχοντα αρχεία αλλά θα παράγει
  # μήνυμα λάθους (Για να σβηστεί το αρχείο πρέπει να χρησιμοποιηθεί το >! ή
  # το >| ). Μπορεί να προκαλέσει πρόβλημα σε αρχεία δέσμης που προσπαθούν
  # να γράψουν σε εικονικά filesystems όπως το /proc και το /sys
  # setopt no_clobber

  # Ερωτά για πιθανές διορθώσεις κακογραμμένων εντολών π.χ. ccp σε cp
  # setopt correct

  # Για τις διορθώσεις χρησιμοποιεί το πληκτρολόγιο dvorak αντί για qwerty
  # setopt dvorak

  # Όταν ένα πρόγραμμα αποτύχει, εμφανίζει την τιμή εξόδου του
  # setopt print_exit_value

  # Κανονικά όταν δωθεί εντολή rm * τυπώνεται ενημερωτικό μήνυμα και ρωτά να
  # πατηθεί y για συνέχεια. Έτσι απενεργοποιείται η λειτουργία αυτή
  # setopt rm_star_silent

  # Σε μια εντολή rm * περιμένει 10 δευτερόλεπτα χωρίς να δέχεται καμμία είσοδο
  # ώστε να αποφευχθεί τυχόν λάθος
  # setopt rm_star_wait

  # Υπό κανονικές συνθήκες, πριν τον τερματισμό του κελύφους στέλνεται σήμα HUP
  # στις εντολές που εκτελούνται στο παρασκήνιο ώστε αυτές να τερματιστούν
  # (εκτός από αυτές που έχουν γίνει disown/nohup). Η παρακάτω επιλογή
  # αποτρέπει αυτήν την λειτουργία.
  # setopt no_hup

  # Ενεργοποιεί την επέκταση παραμέτρων μέσα στα prompt. Χρειάζεται
  # για να λειτουργήσει το vcs_info.
  setopt prompt_subst

fi

# }}}

# Δήλωση μεταβλητών {{{

# Ορίζει σε ποιους καταλόγους θα ψάχνει η εντολή man για manpages
export MANPATH=/usr/local/man:/usr/man
export HOSTNAME="`cat /etc/HOSTNAME`"
export LESSOPEN="|lesspipe.sh %s"
# Αλλάζει την λειτουργία του less ώστε να δίνει περισσότερες πληροφορίες
# και να τερματίζει αν η έξοδος δεν καλύπτει μια ολόκληρη σελίδα
export LESS="-FMRX"
# Απενεργοποιεί το αρχείο ιστορικού του less
export LESSHISTFILE="-"
# Εγκαθιστά μόνο την Ελληνική γλώσσα κατά το compile προγραμμάτων
export LINGUAS="el"
export PAGER="less"
export EDITOR="vim"
# Δήλωση του κελύφους επειδή το zsh δεν το ορίζει και αυτό δημιουργεί
# πρόβλημα στο su (χρειάζεται μέχρι και την έκδοση 13.0)
# export SHELL="/bin/zsh"

# Ορίζει τον μέγιστο αριθμό καταχωρήσεων ιστορικού που θα κρατά το κέλυφος
# κατά την λειτουργία του σε 1000
export HISTSIZE=1000
# Απενεργοποιεί την αποθήκευση των καταχωρήσεων ιστορικού κατά την έξοδο
export SAVEHIST=0
# Το ιστορικό θα αποθηκεύεται στο αρχείο .zsh_history (εφόσον το SAVEHIST
# δεν είναι 0)
export HISTFILE=~/.zsh_history

# Μεταβλητή PATH {{{

# Η μεταβλητή PATH χρησιμοποιείται για την αυτόματη εύρεση προγραμμάτων.
# Στο zsh η μεταβλητή path είναι array και είναι συνδεδεμένη με την PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"

# Προσθέτει καταλόγους που χρειάζονται στον υπερχρήστη
if [[ $EUID == 0 ]]; then
  PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
fi

# Τα αρχεία στο /etc/profile.d δηλώνουν την μεταβλητή PATH και άλλες
# μεταβλητές οπότε η εισαγωγή τους μπορεί να γίνει εδώ. Αν στο μέλλον
# κάποιο αρχείο παράγει έξοδο τότε το παρόν τμήμα θα πρέπει να μεταφερθεί
# στο zshrc
# Το (x) είναι modifier που εμφανίζει μόνο τα εκτελέσιμα αρχεία
for profile_script in /etc/profile.d/*.sh(x) ; do
  . $profile_script
done
unset profile_script

# Αφαιρεί τις διπλές καταχωρήσεις
typeset -U path manpath PATH MANPATH

# }}}

# Ορισμός της μεταβλητής TERM επειδή κάποιες φορές αποτυγχάνει ο αυτόματος
# ορισμός της και αυτό δημιουργεί προβλήματα
if [[ -z $TERM || $TERM == "unknown" ]]; then
 TERM=linux
fi

export PATH DISPLAY TERM

# }}}

# umask {{{
# Θέτει την umask σε 022 (rw-r--r--)
umask 022

# }}}

# Ορισμός ορίων # {{{

# Μεταβολή όλων των ορίων στο σκληρό τους όριο
# unlimit
# Απενεργοποίηση των αρχείων που δημιουργούνται όταν μια εφαρμογή έχει σφάλμα
# Δεν χρησιμοποιείται -h ώστε ο χρήστης να μπορεί να αφαιρέσει το όριο αν
# θέλει να αποσφαλματώσει κάποια εφαρμογή
# limit core 0
# Ορισμός μέγιστου αριθμού ταυτοχρόνων διεργασιών ώστε να μην μπορεί κάποιος
# χρήστης να κάνει επίθεση στο σύστημα. Εδώ χρησιμοποιείται το -h ώστε να
# μην μπορεί να αφαιρεθεί το όριο
# limit -h maxproc 150
# Κανονικά τα όρια θέτονται μόνο για τις διεργασίες που εκτελεί το κέλυφος
# αλλά όχι για το ίδιο το κέλυφος. Η -s θέτει όλα τα όρια που έχουν τεθεί
# μέχρι τώρα και στο ίδιο το κέλυφος
# limit -s

# }}}


# Χρήσιμες πληροφορίες που πρέπει να θυμάμαι # {{{

# Modifiers # {{{

# Στο ιστορικό και στις παραμέτρους χρησιμοποιούνται με : στο τέλος ενώ
# στην δημιουργία ονομάτων αρχείων με (:) στο τέλος
# e = Εμφανίζει μόνο την επέκταση
# h = Αφαιρεί το τελευταίο κομμάτι της διαδρομής (λειτουργεί όπως η dirname)
# l = Μετατρέπει όλα τα γράμματα σε πεζά
# q = Εισάγει εισαγωγικά. Δεν λειτουργεί στην δημιουργία ονομάτων αρχείων
# Q = Αφαιρεί ένα σετ εισαγωγικών
# r = Αφαιρεί την επέκταση (λειτουργεί όπως η basename .επέκταση)
# s/l/r/ = Αντικαθιστά το l με το r. Σε array και δημιουργία αρχείων αλλάζει
# την πρώτη εμφάνιση του l σε κάθε λέξη
# gs/l/r = Αντικαθιστά κάθε εμφάνιση του l
# & = Επαναλαμβάνει την προηγούμενη s
# t = Αφαιρεί την διαδρομή αφήνοντας το αρχείο (όπως η basename)
# u = Μετατρέπει όλα τα γράμματα σε κεφαλαία

# }}}

# Επέκταση μεταβλητών (Parameter Expansion) # {{{

# ${+name}         Αν αν υπάρχει name παράμετρος τότε επιστρέφει 1 αλλιώς 0
# ${name:-word}    Αν υπάρχει name τότε αντικαθιστά την τιμή αλλιώς την word
# ${name:+word}    Αν υπάρχει name τότε αντικαθιστά την word
# ${name:=word}    Αν δεν υπάρχει name τότε του δίνει την τιμή word
# ${name:?word}    Αν δεν υπάρχει name τυπώνει word και έξοδος από το κέλυφος
# ${name#pat}      Αν το pattern υπάρχει στην αρχή του name τότε σβήνει το pat
# ${name%pat}      Αν το pattern υπάρχει στο τέλος του name τότε σβήνει το pat
# ${name:#pat)     Αν το pattern υπάρχει τοτε σβήνει όλο το name
# ${name/pat/rep}  Αντικαθιστά την μεγαλύτερη εμφάνιση του pat με το rep.
#                  Στο pat, # σημαίνει αρχή και % τέλος
# ${name//pat/rep} Αντικαθιστά όλες τις εμφανίσεις του pat
# ${#spec}         Για αλλαγές όπως παραπάνω δίνει τον αριθμό χαρακτήρων.
#                  Για arrays δίνει τον αριθμό στοιχείων στο array
# ${^spec}         Επεξεργάζεται το spec σαν να ήταν pattern (RC_EXPAND_PARAM)
# ${=spec}         Πραγματοποιεί χωρισμό λέξεων όπως με το SH_WORD_SPLIT
# ${~spec}         Επεξεργάζεται το spec σαν να ήταν pattern (GLOB_SUBST)

# }}}

# Σημαίες επέκτασης μεταβλητών (Parameter Expansion Flags) # {{{

# Χρησιμοποιούνται μέσα σε παρενθέσεις ακριβώς μετά την αγκύλη
# ${(#)...}      Θεωρεί ότι επεξεργάζεται σαν αριθμητική έκφραση
# ${(%)...}      Επεκτείνει τα % όπως στα prompt
# ${(@)...}      Τα στοιχεία ενός array θεωρούνται ξεχωριστές λέξεις
#                όταν χρησιμοποιούνται διπλά εισαγωγικά ""
# ${(A)...}      Δημιουργεί array
# ${(c)...}      Μετράει τους χαρακτήρες σε συνδυασμό με το #
# ${(C)...}      Μετατρέπει τον πρώτο χαρακτήρα κάθε λέξης σε κεφαλαίο
# ${(e)...}      Πραγματοποιεί επέκταση παραμέτρων και αριθμών
# ${(f)...}      Χωρίζει το περιεχόμενο σε γραμμές
# ${(k)...}      Σε associative array επιλέγει τα keys αντί για τις τιμές
# ${(L)...}      Μετατρέπει τους χαρακτήρες σε πεζά
# ${(O/o)...}    Ταξινομεί σε αύξουσα/φθίνουσα σειρά
# ${(P)...}      Αντιμετωπίζει το περιεχόμενο σαν να ήταν παράμετρος
# ${(q/Q)...}    Εισάγει/Αφαιρεί ένα σετ εισαγωγικών
# ${(s:string:)} Χωρίζει με βάση το string. Αντί γιατ : μπορούμε να έχουμε
#                οποιοδήποτε χαρακτήρα δεν χρησιμοποιείται στο string
#                π.χ ${(.:.)} χωρίζει με βάση το :
# ${(t)...}      Επιστρέφει τον τύπο της παραμέτρου π.χ local,export,unique
# ${(U)...}      Μετατρέπει τους χαρακτήρες σε κεφαλαία
# ${(v)...}      Μαζί με το (k) εμφανίζει και τα κλειδιά και τις τιμές τους
# ${(w)...}      Μετράει τις λέξεις σε συνδυασμό με το #

# Παραδείγματα # {{{

# foo        = 'hello WORLD'
# bar        = '$HOME'
# ffoo       = 'foo'
# ${(c)#foo) = 11
# ${(C)foo)  = 'Hello World'
# ${(e)bar}  = /home/username
# ${(L)foo}  = 'hello world'
# ${(P)ffoo} = $foo = 'hello WORLD'
# ${(t)foo}  = scalar
# ${(U)foo}  = 'HELLO WORLD'
# ${(w)#foo} = 2

# }}}

# }}}

# Glob Qualifiers # {{{

# Χρησιμοποιούνται κατά την δημιουργία ονομάτων αρχείων (filename globbing)
# στο τέλος μέσα σε παρενθέσεις

# (/)              Κατάλογοι
# (F)              Μη-άδειοι κατάλογοι
# (.)              Αρχεία
# (@)              Συμβολικές συντομεύσεις
# (*)              εκτελέσιμα αρχεία                        (0111)
# (r)              αρχεία αναγνώσιμα από τον ιδιοκτήτη τους (0400)
# (w)              ^ ^ ^ εγγράψιμα  ^ ^ ^                   (0200)
# (x)              ^ ^ ^ εκτελέσιμα ^ ^ ^                   (0100)
# (A)              αναγνώσιμα από την ομάδα                 (0040)
# (I)              εγγράψιμα από την ομάδα                  (0020)
# (E)              εκτελέσιμα από την ομάδα                 (0010)
# (R)              αναγνώσιμα από άλλους                    (0004)
# (W)              εγγράψιμα από άλλους                     (0002)
# (X)              εκτελέσιμα από άλλους                    (0001)
# (s)              αρχεία setuid                            (4000)
# (S)              αρχεία setgid                            (2000)
# (t)              sticky bit                               (1000)
# (l[-|+]ct)       αρχεία με αριθμό links μικρότερο/μεγαλύτερο/ίσο με ct
# (U)              αρχεία που ανήκουν στο effective ID
# (G)              αρχεία που ανήκουν στο effective GID
# (uid)            αρχεία που ανήκουν στο id π.χ (u100) ή (u:user:) ή (u[user])
# (gid)            το ίδιο για GID
# (a[Mwhms][-|+]n) αρχεία στα οποία έγινε πρόσβαση πριν λίγοτερο/περισσότερο/
#                  ακριβώς n μέρες/Μήνες/εβδομάδες/ώρες/λεπτά/δευτερόλεπτα
# (m[Mwhms][-|+]n) το ίδιο για mtime
# (c[Mwhms][-|+]n) το ίδιο για ctime
# (L[kmp][+|-]n)   αρχεία με μέγεθος μικρότερο/μεγαλύτερο/ίσο με n bytes/kilo/
#                  mega/blocks π.χ (L-50) ή (Lk-50)
# ^                Αντιστροφή του ελέγχου
# -                Ακολούθηση των συμβολικών συντομεύσεων
# (oc)             Ταξινόμηση με βάση c=[nLlamc] για όνομα/μέγεθος/αριθμό links
#                  /{a,m,c}time
# (Oc)             ^ ^ ^ αλλά φθίνουσα

# π.χ ls *(/) θα εμφανίσει όλους τους καταλόγους

# }}}

# }}}
