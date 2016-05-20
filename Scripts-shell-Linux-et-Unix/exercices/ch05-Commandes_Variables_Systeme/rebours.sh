#! /bin/sh

for i in $(seq 5 -1 1)
do
	echo "Reste $i secondes avant l'action"
	sleep 1
done

echo "Action !"
