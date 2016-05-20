#! /bin/sh

for fic in "$@"
do
	# supprimons les lignes blanches
	sed -e '/^[[:blank:]]*$/d'  $fic |
	# supprimons les commentaires
	sed -e '/^[[:blank:]]*#/d'
done


