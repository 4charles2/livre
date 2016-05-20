#! /bin/sh
#
# Attend que les processus mentionnes en argument
# aient disparus.

NOM_SCRIPT=$(basename "$0")

if [ $# -eq 0 ]; then
	echo "usage: $(NOM_SCRIPT) PID..." >&2
	exit 1
fi

NB_PID=0
while [ -n "$1" ]
do
	PID[$NB_PID]="$1"
	NB_PID=$((NB_PID+1))
	shift
done

termine=false
while ! $termine
do
	termine=true
	i=0
	while [ "$i" -lt ${NB_PID} ]
	do
		ps "${PID[$i]}" >/dev/null 2>&1
		if [ $? -ne 0 ];
		then
			PID[$i]=0
		else
			termine=false
		fi
		i=$((i+1))
	done
	sleep 1
done
