#!/bin/bash

: '
3.
Parašykite scenarijų (script), kuris:
1. nuskaito failo stud.txt turinį;
2. atrenka eilutes, kur penktojo stulpelio reikšmė yra "FAIL";
3. išveda atrinktas eilutes kaip parodyta:
'

file=stud.txt

if [[ ! -f $file ]];
then
    echo "Failas $file nerastas!"
    exit 1
fi

awk '$5 == "FAIL" { printf "%s. %s %s %s\n", substr($1, 1, 1), $2, $3, $4 }' $file
