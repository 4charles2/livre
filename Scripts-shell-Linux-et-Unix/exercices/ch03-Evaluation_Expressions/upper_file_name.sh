#! /bin/sh

for fic in "$@"
do
	FIC=$(echo "$fic" | tr '[[:lower:]]' '[[:upper:]]')
	if [ "$fic" != "$FIC" ]
	then
		mv "$fic" "$FIC"
	fi	
done
