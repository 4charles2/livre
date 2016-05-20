#! /bin/sh
#
# Ce script efface les fichiers indiques sur la ligne de commande
# en les ecrasant à plusieurs reprises par des bits a 0 et a 1.


NB_ITERATIONS=10

for fic in "$@"
do
	if [ ! -f "$fic" ]; then echo "$fic: pas un fichier regulier"; fi
	if [ ! -w "$fic" ]; then echo "$fic: impossible d'écrire"; fi
	taille_fic=$(ls -l "$fic" | awk '{print $5}')
	echo "Effacement $fic"
	i=1
	while [ $i -le $NB_ITERATIONS ]
	do
		echo "Ecrasement numero $i"
		dd if=/dev/zero bs=1 count=$taille_fic > "$fic"
		dd if=/dev/zero bs=1 count=$taille_fic | tr '\000' '\377' > "$fic"
		i=$((i+1))
	done
	rm -f "$fic"
done
