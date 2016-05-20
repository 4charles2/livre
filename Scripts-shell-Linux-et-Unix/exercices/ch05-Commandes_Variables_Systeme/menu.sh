#! /bin/sh

cat <<- FIN
  Choisissez une option :
    
  1 - Cr�er une nouvelle archive
  2 - Transf�rer une archive sur bande
  3 - Envoyer une archive au serveur
  4 - R�cuperer une ancienne archive
  5 - Lister le contenu d'une archive
    
  0 - Quitter
FIN

while true
do
	echo -n "Votre choix : "
	read reponse

	case "$reponse" in
		"1" ) echo "Pr�t � cr�er une nouvelle archive" ;;
		"2" ) echo "Pr�t � transf�rer une archive sur bande" ;;
		"3" ) echo "Pr�t � envoyer une archive au serveur" ;;
		"4" ) echo "Pr�t � r�cuperer une ancienne archive" ;;
		"5" ) echo "Pr�t � lister le contenu d'une archive" ;;
		"0" ) echo "Au revoir..." ; exit 0 ;;
		  * ) echo "Option $reponse inconnue" ;;
	esac
done

