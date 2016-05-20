#! /bin/sh

# Etudie le contenu de la variable $- qui contient les options
# active du shell et les present en clair.
#
# Ce script sera generalement invoque ainsi : ". options_shell.sh"

options=$-

while [ -n "$options" ]
do
	echo set -${options:0:1}
	options=${options:1}
done
