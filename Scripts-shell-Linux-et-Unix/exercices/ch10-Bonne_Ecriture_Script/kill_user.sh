#! /bin/sh
#
# Tue (en envoyant le signal 9) tous les processus
# des utilisateurs indiques sur la ligne de commande.

NOM_SCRIPT=$(basename "$0")

if [ $# -eq 0 ]; then
	echo "usage: $(NOM_SCRIPT) user_name..." >&2
	exit 1
fi

for arg in "$@"; do
	ps aux |\
	awk -v user="$arg" '($1 == user) {print $2}' |\
	xargs kill -9
done


