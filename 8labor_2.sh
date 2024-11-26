#!/bin/bash

: '
2.
Parašykite scenarijų (script), kuris:
nuskaito dviejų parametrų reikšmes (1 – failo vardas, 2 – aplanko pavadinimas);
patikrina ar yra įvestos parametrų reikšmės:
o jeigu ne – išveda pranešimą ir baigia darbą #(komanda exit).
o jeigu taip – patikrina ar įvestos reikšmės yra:
1 – failo vardas, 2 – aplanko pavadinimas.
Esant netinkamam įvedimui, išveda pranešimą ir baigia darbą.
Esant tinkamam įvedimui iškviečia meniu, kuris leidžia:
1. Patikrinti ar failas yra vykdomasis;
2. Paversti failą vykdomuoju;
3. Nukopijuoti failą į nurodytą aplanką;
4. Baigti darbą.
'

if [[ -f $1 && -d $2 ]]
then
    PS3="Pasirinkite [1-4]: "
    select chc in "Patikrinti ar failas $1 yra vykdomasis" "Paversti failą $1 vykdomuoju" "Nukopijuoti failą $1 į aplanką $2" "Išeiti";
    do
        case $chc in
        "Patikrinti ar failas $1 yra vykdomasis")
            if [[ -x $1 ]];
            then
                echo "Failas $1 yra vykdomasis."
                echo
            else
                echo "Failas $1 nėra vykdomasis."
                echo
            fi
            ;;
        "Paversti failą $1 vykdomuoju")
            chmod +x $1
            echo "Failas $1 paverstas vykdamuoju."
            echo
            ;;
        "Nukopijuoti failą $1 į aplanką $2")
            cp $1 $2
            echo "Failas $1 nukopijuotas į aplanką $2."
            echo
            ;;
        "Išeiti")
            echo "Geros dienos!"
            break
            ;;
        *)
            echo "Netinkamas pasirinkimas"
            echo
            ;;
        esac
    done

elif [[ -d $1 && -f $2 ]];
then
    echo "Netinkama įvestis (1 - failas, 2 - aplankas)"
    exit 1
else
    echo "Trūksta parametrų reikšmių!"
    exit 1
fi