#! /bin/sh

cat <<- FIN
  Choisissez une option :
    
  1 - Créer une nouvelle archive
  2 - Transférer une archive sur bande
  3 - Envoyer une archive au serveur
  4 - Récuperer une ancienne archive
  5 - Lister le contenu d'une archive
    
  0 - Quitter
FIN

while true
do
	echo -n "Votre choix : "
	read reponse

	case "$reponse" in
		"1" ) echo "Prêt à créer une nouvelle archive" ;;
		"2" ) echo "Prêt à transférer une archive sur bande" ;;
		"3" ) echo "Prêt à envoyer une archive au serveur" ;;
		"4" ) echo "Prêt à récuperer une ancienne archive" ;;
		"5" ) echo "Prêt à lister le contenu d'une archive" ;;
		"0" ) echo "Au revoir..." ; exit 0 ;;
		  * ) echo "Option $reponse inconnue" ;;
	esac
done

