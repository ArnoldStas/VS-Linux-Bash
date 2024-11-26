#!/bin/bash

: '
2.

Visus veiksmus atlikite komandos sed pagalba. 
1. Išveskite ekrane nurodytas failo vim_man.txt eilutes: 
* tik penktą eilutę; 
* nelygines eilutes (1,3,5 ir t. t.)  
* nuo 25 iki 50 eilutės; 
* 10 pirmų eilučių; 
* paskutinę eilutę. 
2. Išveskite visų eilučių, kuriose yra žodis errorfile, numerius. 
3. Pašalinkite eilutes, kuriose yra žodis errorfile, rezultatą išsaugokite faile no_errorfile.txt 
4. Pakeiskite visus žodžius "Vim" žodžiais "*VIM*". Ekrane išspausdinkite tik pakeistas eilutes. 
5. Naudodami tik vieną sed komandą, pridėkite eilutę "This is beginning of file" prieš pirmąją failo 
vim_man.txt eilutę ir eilutę "This is the end of file" po paskutinės failo eilutės. 
6. Po eilutės ON-LINE HELP pridėkite tuščią eilutę. 
7. Antrą failo vim_man.txt eilutę pakeiskite eilute "Vim is a free and open-source, screen-based 
text editor program."
'

#1.
#sed -n '5p' vim_man.txt; echo
#sed -n '1~2p' vim_man.txt; echo
#sed -n '25,50p' vim_man.txt; echo
#sed -n '1,10p' vim_man.txt; echo
#sed -n '$p' vim_man.txt; echo

#2.
#sed -n '/errorfile/=' vim_man.txt; echo

#3.
#sed '/errorfile/d' vim_man.txt > no_errorfile.txt

#4.
#sed -n 's/Vim/*VIM*/p' vim_man.txt

#5.
#sed -e '1i This is beginning of file' vim_man.txt -e '$a This is the end of File' vim_man.txt

#6.
#sed -e '/ON-LINE HELP/G' vim_man.txt

#7.
#sed '2 c Vim is a free and open-source, screen-based text editor program.' vim_man.txt