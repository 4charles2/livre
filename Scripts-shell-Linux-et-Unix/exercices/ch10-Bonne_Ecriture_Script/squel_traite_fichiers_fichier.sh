#! /bin/sh
#
# Ce script est un squelette de traitement de tous
# les fichiers listes dans le(s) fichier(s) en argument.


for fic_liste in "$@"
do
	if [ ! -r "$fic_liste" ]
	then
		echo "$fic_liste: impossible de lire" >&2
		continue
	fi

	cat "$fic_liste" | \
	while read fic
	do
		if [ ! -f "$fic" ]
		then
			echo "$fic: traitement impossible"
		else
			echo "Traitement de $fic en cours"
		fi
		sleep 1
	done
done
