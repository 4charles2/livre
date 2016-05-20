#! /bin/sh

i=1
while [ $i -le 5 ]
do
	echo "$@"
	sleep 1
	i=$((i+1))
done
