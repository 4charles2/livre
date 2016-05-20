#! /bin/sh
#
# Ce script montre comment automatiser une commande interactive,
# un tranfert FTP en l'occurrence.


# Les trois premiers arguments sont obligatoires.
if [ $# -lt 3 ]; then
	echo "usage: $0 machine chemin fichiers [login] [password]" >&2
	exit 1
fi
MACHINE=$1
CHEMIN=$2
FICHIERS=$3

# Les arguments suivant sont facultatifs.
LOGIN=${4:-anonymous}
PASSWORD=${5:-$USER@$HOSTNAME}

# Sauver l'�ventuel fichier ~/.netrc
if [ -f ~/.netrc ] ; then mv ~/.netrc ~/.netrc.copie ; fi

# Cr�er un nouveau ~/.netrc avec les infos concernant 
# uniquement la connexion voulue
echo machine $MACHINE > ~/.netrc
echo login $LOGIN >> ~/.netrc
echo password $PASSWORD >> ~/.netrc

# Rendre le fichier lisible uniquement par son propri�taire
chmod 600 ~/.netrc

# Lancer la connexion en transmettant les ordres s�par�s par des
# retours-chariots
ftp <<- FIN
	open $MACHINE
	bin
	prompt
	cd $CHEMIN
	mget $FICHIERS
	quit
FIN

# Effacer ~/.netrc et r�cup�rer l'�ventuelle sauvegarde
rm -f ~/.netrc
if [ -f ~/.netrc.copie ] ; then mv ~/.netrc.copie ~/.netrc ; fi

