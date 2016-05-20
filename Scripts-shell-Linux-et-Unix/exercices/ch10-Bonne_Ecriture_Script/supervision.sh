#! /bin/sh

# Ce script permet d'installer une fois pour toute un systeme de
# supervision sur une batterie de machines. On pourra ensuite
# passer des ordres ou y transferer des fichiers sans avoir a
# ressaisir le mot de passe.

# Ce script s'appuie sur la presence d'un serveur SSHD sur les
# machines supervisees.

i=1;
# La premiere colonne correspond aux noms des hotes et
# la seconde aux noms d'utilisateurs à employer pour la supervision.
hote[$i]="192.168.1.1";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.2";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.3";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.4";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.5";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.6";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.7";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.8";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.9";  user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.10"; user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.11"; user[$i]="root";	i=$((i+1))
hote[$i]="192.168.1.12"; user[$i]="root";	i=$((i+1))
nb_postes=$i

########################

function afficher_aide
{
	echo "USAGE" >&2
	echo "  $1 action [arguments...]" >&2
	echo "ACTIONS" >&2
	echo "  install">&2
	echo "    installer le système de supervision sur toutes les stations" >&2
	echo "  halt" >&2
	echo "    arrêter toutes les stations supervisées" >&2
	echo "  reboot">&2
	echo "    redémarrer toutes les stations supervisées" >&2
	echo "  upload local remote">&2
	echo "    copier le fichier \"local\" à l'emplacement \"distant\" sur toutes les stations" >&2 
	echo "  download distant prefixe">&2
	echo "    copier tous les fichiers \"distants\" en local avec le \"prefixe\" suivi du nom de station" >&2
	echo "  execute commande..." >&2
	echo "    exécute la \"commande\" sur un shell distant">&2
}


function installer_supervision
{
	local i
	rm -rf ~/.ssh
	ssh-keygen -t rsa
	cle=$(cat ~/.ssh/id_rsa.pub)
	i=1
	while [ $i -lt $nb_postes ]; do
		ssh -o StrictHostKeyChecking=no ${user[$i]}@${hote[$i]} \
		  "rm -rf .ssh; mkdir .ssh; echo $cle > .ssh/authorized_keys"
		i=$((i+1))
	done
}

function download_file
{
	local r="$1"
	local p="$2";
	local i
	i=1
	while [ $i -lt $nb_postes ]
	do
		if ping -c 1 -w 1 ${hote[$i]} >/dev/null 2>&1
		then
			echo "${hote[$i]}"
			scp "${user[$i]}@${hote[$i]}:$r" "$p"-${hote[$i]}
		fi
		i=$((i+1))
	done
}

function upload_file
{
	local l="$1"
	local r="$2";
	local i
	i=1
	while [ $i -lt $nb_postes ]
	do
		if ping -c 1 -w 1 ${hote[$i]} >/dev/null 2>&1
		then
			echo "${hote[$i]}"
			scp "$l" "${user[$i]}@${hote[$i]}:$r"
		fi
		i=$((i+1))
	done
}

function executer_commande
{
	local i
	i=1
	while [ $i -lt $nb_postes ]
	do
		if ping -c 1 -w 1 ${hote[$i]} >/dev/null 2>&1
		then
			echo "======= ${hote[$i]} ======="
			ssh ${user[$i]}@${hote[$i]} "$*"
		fi
		i=$((i+1))
	done
}


if [ "$*" = "" ]
then 
	afficher_aide $0
	exit 0
fi

case $1 in
	instal*  )
		shift
		if [ $# -ne 0 ]; then echo "$0: trop d'arguments"; exit 2; fi
		installer_supervision ;;
	download )
		shift
		if [ $# -ne 2 ]; then echo "$0 : mauvais nombre d'arguments"; exit 2; fi
		download_file "$1" "$2"
		;;
	upload )
		shift
		if [ $# -ne 2 ]; then echo "$0 : mauvais nombre d'arguments"; exit 2; fi
		upload_file "$1" "$2"
		;;
	exec* )
		shift 
		executer_commande "$@" ;;
	* )
		echo "Action inconnue. Invoquez \"$0\" seul pour avoir de l'aide" >&2
		exit 1
		;;
esac

