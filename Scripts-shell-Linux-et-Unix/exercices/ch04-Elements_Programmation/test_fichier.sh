#! /bin/sh

for i in "$@" ; do
	echo "$i : "
	if [ -L "$i" ] ; then echo "  (lien symbolique) " ; fi
	if [ ! -e "$i" ] ; then 
		echo "  n'existe pas"
		continue
	fi
	echo -n "  type = "
		[ -b "$i" ] && echo "spécial bloc "
		[ -c "$i" ] && echo "spécial caractère "
		[ -d "$i" ] && echo "répertoire "
		[ -f "$i" ] && echo "fichier régulier "
		[ -p "$i" ] && echo "tube nommé "
		[ -S "$i" ] && echo "socket "
	echo -n "  accès = "
		[ -r "$i" ] && echo -n "lecture "
		[ -w "$i" ] && echo -n "écriture "
		[ -x "$i" ] && echo -n "exécution "
	echo ""
		[ -G "$i" ] && echo "  à notre GID"
		[ -O "$i" ] && echo "  à notre UID" 
done
