#! /bin/sh

# Ce script affiche un indicateur de progression
# que l'on pourrait employer pour faire patienter
# l'utilisateur pendant une installation ou un
# traitement.

function progression
{
	printf "\r--> %2d%% <--" ${1:-0}
}


echo "Installation en cours :"
i=0
while [ $i -le 10 ]
do
	progression $((i * 10 ))
	sleep 1
	i=$((i+1))
done
echo ""
