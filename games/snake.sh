#!/bin/bash

# Nastavení herního pole
radek=20
sloupec=40
had="3 4 2 4 1 4"  # Počáteční pozice hada
jídlo_radek=10
jídlo_sloupec=20
skóre=0
konec_hry=0

# Funkce pro vykreslení herního pole
nakresli_herni_pole() {
    clear
    for ((i = 0; i < radek; i++)); do
        for ((j = 0; j < sloupec; j++)); do
            if [[ $i -eq 0 || $i -eq $((radek - 1)) || $j -eq 0 || $j -eq $((sloupec - 1)) ]]; then
                echo -n "#"
            elif [[ $i -eq $jídlo_radek && $j -eq $jídlo_sloupec ]]; then
                echo -n "@"
            else
                lokální je_část_hada=0
                for část in $had; do
                    lokální řádek_části=$((část / sloupec))
                    lokální sloupec_části=$((část % sloupec))
                    if [[ $i -eq $řádek_části && $j -eq $sloupec_části ]]; then
                        echo -n "*"
                        je_část_hada=1
                        break
                    fi
                done
                [[ $je_část_hada -eq 0 ]] && echo -n " "
            fi
        done
        echo
    done
    echo "Skóre: $skóre"
}

# Funkce pro pohyb hada
pohyb_hada() {
    lokální hlava_řádek=$((had))
    lokální hlava_sloupec=$((had))
}

# Hlavní herní smyčka
while [[ $konec_hry -eq 0 ]]; do
    nakresli_herni_pole
    read -n 1 -t 0.2 směr
    case $směr in
        w)  had=;;
        a)  had=;;
        s)  had=;;
        d)  had=;;
        q)  konec_hry=1
            echo "Konec hry. Celkové skóre: $skóre"
            ;;
    esac
done