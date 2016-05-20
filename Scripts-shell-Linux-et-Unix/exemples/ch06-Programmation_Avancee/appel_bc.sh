#! /bin/sh

X=1.234
Y=5.6789
Z=$( echo "$X * $Y" | bc -l)
echo "Z vaut : $Z"
