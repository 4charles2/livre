#! /bin/sh

for FIC in "$@"
do
	fic=$(echo "$FIC" | tr '[[:upper:]]' '[[:lower:]]')
	if [ "$FIC" != "$fic" ]
	then
		mv "$FIC" "$fic"
	fi	
done
