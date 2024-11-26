#!/bin/bash

#1. Sukurkite aplankų DIR1 – DIR6 struktūrą:
#mkdir DIR1 -p DIR2/DIR3 DIR2/DIR4/DIR5 DIR6

#2.
#Aplanke DIR3 sukurkite du tuščius failus f1 ir f2.
#Nukopijuokite failus f1 ir f2 į aplanką DIR1.
#cd DIR2/DIR3
#touch f1 f2
#cp f1 f2 /home/arnoldas/DIR1
#tree -R

#3.Komandos ls pagalba peržiūrėkite einamojo aplanko #turinį. Panaudokite įvairias opcijas.
#ls -l #parodo daugiau informacijos apie failus, esancius aplanke
#ls -a

#4. Ištrinkite aplanką DIR3.
#rm /home/arnoldas/DIR2/DIR3 -R

#5.
#Aplanke DIR2
#cd DIR2

#komandos cat pagalba sukurkite naują failą file1, kuriame įrašykite kelias teksto eilutes.
#cat > file1
#Hello World!
#cttrl+D

#Peržiūrėkite failo file1 turinį.
#cat file1

#Sukurkite failą file2, kuriame įrašykite kelias teksto eilutes.
#cat > file2
#Arnoldas Stasiūnas
#ctrl+D

#Komandos cat pagalba išveskite failų file1 ir file2 turinius vienu metu, komandos vykdymo
#rezultatą nukreipkite į failą file3.
#cat file1 file2 > file3

#Peržiūrėkite failo file3 turinį.
#cat file3

: '
6.
Komandos wc pagalba raskite failų file1 ir file2 eilučių ir žodžių skaičių, rezultatą išveskite į failą file4.
Peržiūrėkite failo file4 turinį.
'

wc file1 file2 > file4
cat file4

: '
7.
Sukurkite scenarijų (bash script), kuriame:
Sukurkite tris kintamuosius ir priskirkite jiems komandos date vykdymo rezultatus:
pirmam kintamajam – date +%F (data YYYY-MM-DD formatu),
antram kintamajam – date +%A (savaitės diena),
trečiam kintamajam – date +%U (savaitės numeris).
'

data=$(date +%F)
diena=$(date +%A)
numeris=$(date +%U)

echo -e "\nDATE: $data\nWEEKDAY: $diena\nWEEK NUMBER: $numeris"
