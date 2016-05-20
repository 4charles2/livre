#! /bin/sh

function reponse
{
	local rep
	while true
	do
		echo -n "$@ (O/N) " >&2
		read rep
		case "$rep" in
			[OoYy]* ) return 0 ;;
			  [Nn]* ) return 1 ;;
		esac
	done
}

mini=1
maxi=1000

echo "Choisissez un nombre entre 1 et 1000, je vais essayer de le deviner."

while true
do
	milieu=$(( (mini+maxi) / 2 ))
	reponse "le nombre est-il superieur ou égal à $milieu"
	if [ $? -eq 0 ]
	then
		mini=$milieu
	else
		maxi=$milieu
	fi
	if [ $mini -eq $maxi ] || [ $mini -eq $((maxi - 1)) ]
	then
		echo "Le nombre est $mini"
		break
	fi
done

