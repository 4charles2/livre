#! /bin/sh

for arg in "$@"
do
	chemin=${arg%/*}/
	fichier=${arg##*/}
	echo "$arg :"
	echo "   chemin  $chemin"
	echo "   fichier $fichier"
done
