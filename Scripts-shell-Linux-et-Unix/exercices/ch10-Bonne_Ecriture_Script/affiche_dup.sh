#! /bin/sh
#
# Affiche les fichiers identiques parmi ceux fournis
# sur la ligne de commande.
#
# Depend des options specifiques GNU de uniq et md5sum.

	
md5sum "$@" |\
sort        |\
uniq --all-repeated=separate -w 32 |\
cut -b 35-


