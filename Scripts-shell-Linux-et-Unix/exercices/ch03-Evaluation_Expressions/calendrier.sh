#! /bin/sh

# obtenir l'annee en cours
annee=$(date +"%Y")

# calculer l'annee suivante
suivante=$((annee + 1))

# appeler la commande cal
cal $suivante

