#! /bin/sh

EXPRESSION="$1"
# Eliminons l'expression des arguments de ligne de commande :
shift
# Puis comparons-la avec les chaines :
for chaine in "$@"
do
	echo "$chaine" | grep "$EXPRESSION" > /dev/null
	if [ $? -eq 0 ]
	then
		echo "$chaine : OUI"
	else
		echo "$chaine : NON"
	fi
done
