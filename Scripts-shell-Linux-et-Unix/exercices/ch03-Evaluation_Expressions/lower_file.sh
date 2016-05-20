#! /bin/sh

for fic in "$@"
do
	tr '[[:upper:]]' '[[:lower:]]' < "$fic" > "${fic}.tmp"
	mv "${fic}.tmp" "$fic"
done

