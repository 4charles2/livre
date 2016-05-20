#! /bin/sh

for i in "$@" ; do
	echo "$i : "
	if [ -L "$i" ] ; then echo "  (lien symbolique) " ; fi
	if [ ! -e "$i" ] ; then 
		echo "  n'existe pas"
		continue
	fi
	echo -n "  type = "
		[ -b "$i" ] && echo "sp�cial bloc "
		[ -c "$i" ] && echo "sp�cial caract�re "
		[ -d "$i" ] && echo "r�pertoire "
		[ -f "$i" ] && echo "fichier r�gulier "
		[ -p "$i" ] && echo "tube nomm� "
		[ -S "$i" ] && echo "socket "
	echo -n "  acc�s = "
		[ -r "$i" ] && echo -n "lecture "
		[ -w "$i" ] && echo -n "�criture "
		[ -x "$i" ] && echo -n "ex�cution "
	echo ""
		[ -G "$i" ] && echo "  � notre GID"
		[ -O "$i" ] && echo "  � notre UID" 
done
