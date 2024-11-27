#!/bin/bash

: '
1.

Sukurkite tuščią failą  paskyros.txt . 
Sukurkite meniu, kuris leidžia pasirinkti vieną iš punktų: 
1. Registruotis 
2. Prisijungti 
3. Darbo pabaiga 
 
Pasirinkus punktą Registruotis: 
* paprašo įvesti prisijungimo vardą; 
* patikrina, ar toks vardas jau egzistuoja faile paskyros.txt; 
* jeigu toks vardas egzistuoja, išveda atitinkamą pranešimą ir grįžta į meniu; 
* jeigu toks vardas neegzistuoja, paprašo įvesti slaptažodį. Išsaugo prisijungimo vardą ir 
slaptažodį  (vardas slaptažodis) faile paskyros.txt ir grįžta į meniu. 
 
Pasirinkus punktą Prisijungti: 
* paprašo įvesti prisijungimo vardą bei slaptažodį; 
* patikrina ar tokia paskyra egzistuoja faile paskyros.txt; 
* jeigu tokia paskyra neegzistuoja, išveda atitinkamą pranešimą ir grįžta į meniu; 
* jeigu tokia paskyra egzistuoja, pereina prie teksto filtravimo.  
 
Filtravimas 
Sukurkite meniu, kuris leidžia atlikti nurodytus veiksmus: 
1. Išvesti didžiausio failo vardą ir dydį ir grįžti į filtravimo meniu. 
2. Išvesti tuščių failų sąrašą ir grįžti į filtravimo meniu. 
3. Atrinkti failo empl_min_max.txt eilutes, kur MIN_SALARY >= n (kintamojo n reikšmė 
nuskaitoma komandos read pagalba) ir išvesti JOB_TITLE ir MIN_SALARY stulpelius. 
Grįžti į filtravimo meniu. 
4. Baigti darbą. 
'

Registruotis() {

    echo
    read -rp "Create USERNAME: " username
    #echo "$username"

    if grep -qiw "$username" "paskyros.txt";
    then
        echo -e "Toks vartotojas jau yra!\n"
        return
    else
        read -rp "Create PASSWORD: " password
        #echo "$password"
        echo "$username" "$password" >> paskyros.txt
        echo
    fi
}

Prisijungti() {

    echo
    read -rp "Enter USERNAME: " username
    #echo "$username"

    if ! grep -qiw "$username" "paskyros.txt";
    then
        echo -e "Tokio vartotojo nėra!\n"
        return
    fi

    read -rp "Enter PASSWORD: " password
    #echo "$password"

    if grep -qiw "$username $password" "paskyros.txt";
    then
        echo -e "PASSWORD teisingas!\n"
        Filtravimas
    else
        echo -e "PASSWORD neteisingas!\n"
    fi
}

Filtravimas() {

    MaxFile() {
        echo
        ls -lh | grep '^-' | awk 'NR > 1 {if ($5 > max) {max = $5; file = $9}} END {print file, max, "B"}'
        echo
    }

    EmptyFile() {
        echo
        ls -l | grep '^-' | awk '$5 == 0 {print $9}'
        echo
    }

    Empl_min_max() {
        echo
        read -rp "Enter MIN_SALARY: " n
        echo
        awk -v n="$n" '$3 >= n {print $1, $3}' empl_min_max.txt
        echo
    }

    select chc in "Išvesti didžiausio failo vardą ir dydį ir grįžti į filtravimo meniu" "Išvesti tuščių failų sąrašą ir grįžti į filtravimo meniu" "Atrinkti failo empl_min_max.txt eilutes, kur MIN_SALARY >= n (kintamojo n reikšmė nuskaitoma komandos read pagalba) ir išvesti JOB_TITLE ir MIN_SALARY stulpelius" "Baigti darbą"
    do
        case $REPLY in
            1) MaxFile;;
            2) EmptyFile;;
            3) Empl_min_max;;
            4) exit;;
        esac
    done
}

#touch paskyros.txt

select item in "Registruotis" "Prisijungti" "Darbo pabaiga"
do
    case $REPLY in
        1) Registruotis;;
        2) Prisijungti;;
        3) exit;;
    esac
done