#! /bin/sh

for fic in "$@"
do
	tr '[[:lower:]]' '[[:upper:]]' < "$fic" > "${fic}.tmp"
	mv "${fic}.tmp" "$fic"
done

