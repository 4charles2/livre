function repondre_oui_ou_non
{
	# Cette fonction pose  a l'utilisateur la question passee
	# en argument et attend en reponse 'O' ou 'N'. Le code de
	# retour est Vrai pour une reponse 'O'  et Faux pour 'N'.
	local reponse
	while true
	do
		echo "$@ (O/N)" >&2
		read reponse
		if [ "$reponse" = "O" ]; then return 0; fi		
		if [ "$reponse" = "N" ]; then return 1; fi
	done
}


