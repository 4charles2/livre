#! /bin/sh
#
# Affiche un message et attend confirmation pendant 10 secondes.



	DELAI=10

	while [ "$DELAI" -gt 0 ]
	do
		printf "\rPour continuer, pressez 'y' avant $DELAI secondes "
		DELAI=$((DELAI - 1))
		stty -icanon min 0 time 10
		read
		if [ "$REPLY" != "" ]; then break; fi
	done

	printf "\n"
	stty sane

	if [ "$REPLY" != "y" ] && [ "$REPLY" != "Y" ]
	then
		echo "Abandon..."
		exit 0
	fi

	echo "On continue..."


