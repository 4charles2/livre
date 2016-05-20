#! /bin/sh

# Ce script prend en argument une duree en secondes, puis
# une commande (avec elle-meme d'eventuels arguments).
# Il la lance en s'arrangeant pour limiter son execution
# a la duree indiquee.


NOM_SCRIPT=$(basename "$0")

if [ $# -lt 2 ]; then
	echo "usage: $(NOM_SCRIPT) duree commande..." >&2
	exit 1
fi

DUREE="$1"
shift

"$@" &
PID=$!

i=0
while [ $i -lt $DUREE ]
do
	sleep 1
	ps $PID > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		exit 0
	fi
	i=$((i+1))
done

kill -QUIT $PID
kill -TERM $PID
kill -INT  $PID
kill -KILL $PID

