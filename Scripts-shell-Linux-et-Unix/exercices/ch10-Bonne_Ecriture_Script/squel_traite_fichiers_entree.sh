#! /bin/sh
#
# Ce script est un squelette de traitement de tous
# les fichiers indiques sur son entree standard

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
