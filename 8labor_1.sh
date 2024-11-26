#!/bin/bash

: '
1.
Sukurkite scenarijų (script), kuris išveda ekrane visų einamojo aplanko vykdomųjų failų sąrašą ir jų skaičių:
'

echo
count=0
for file in $(ls)
do
    if [[ -f $file && -x $file ]]
    then
        echo "$file"
        (( count++ ))
    fi
done
echo
echo "Vykdomųjų failų skaičius - $count"