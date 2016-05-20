#! /bin/sh

	VERSION=0.
	AUTEUR="Christophe Blaess"

	NOM_SCRIPT=$(basename $0)

function affiche_aide
{
	echo "$NOM_SCRIPT $VERSION - $AUTEUR" >&2
	cat >&2 <<- FIN_CAT
		Ce script recoit en arguments deux chaines suivis d'une
		liste de noms de fichiers.
		Il recherche les fichiers dont le nom contient la premiere
		chaine, et la remplace alors par la seconde.

		Ex: $0 IMAGE image *.jpg
		remplacera toutes les occurrences du mot IMAGE par image
		dans le nom de tous les fichiers d'extension jpg.
	FIN_CAT
}

if [ $# -le 2 ]; then
	affiche_aide
	exit 0;
fi

MOTIF="$1"
shift

REMPLACEMENT="$1"
shift

if [ "$MOTIF" = "$REMPLACEMENT" ]; then
	exit 0
fi

for fic in "$@"
do
	if [ ! -e "$fic" ]; then
		echo "$fic: introuvable"
		continue;
	fi

	ancien_nom="$fic"

	while true; do
		case "$fic" in
			*${MOTIF}* )
				avant="${fic%%${MOTIF}*}"
				apres="${fic#*${MOTIF}}"
				fic="${avant}${REMPLACEMENT}${apres}"
				;;
			* ) break
				;;
		esac
	done

	nouveau_nom="$fic"

	if [ "$ancien_nom" != "$nouveau_nom" ]
	then
		mv "$ancien_nom" "$nouveau_nom"
	fi
done

