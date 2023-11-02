#!/bin/bash

# Funkce pro sčítání
secti() {
    vysledek=$((cislo1 + cislo2))
    echo "Výsledek: $vysledek"
}

# Funkce pro odčítání
odeber() {
    vysledek=$((cislo1 - cislo2))
    echo "Výsledek: $vysledek"
}

# Funkce pro násobení
nasob() {
    vysledek=$((cislo1 * cislo2))
    echo "Výsledek: $vysledek"
}

# Funkce pro dělení
del() {
    if [ $cislo2 -eq 0 ]; then
        echo "Chyba: Dělení nulou není povoleno."
    else
        vysledek=$(awk "BEGIN {print $cislo1 / $cislo2}")
        echo "Výsledek: $vysledek"
    fi
}

# Hlavní smyčka kalkulačky
while true; do
    echo "Vyberte operaci:"
    echo "1. Sčítání"
    echo "2. Odčítání"
    echo "3. Násobení"
    echo "4. Dělení"
    echo "5. Konec"
    read -p "Zadejte volbu (1/2/3/4/5): " volba

    if [ $volba -eq 5 ]; then
        echo "Sbohem!"
        break
    fi

    if [ $volba -ge 1 ] && [ $volba -le 4 ]; then
        read -p "Zadejte první číslo: " cislo1
        read -p "Zadejte druhé číslo: " cislo2
    else
        echo "Neplatná volba. Prosím, vyberte platnou operaci (1/2/3/4/5)."
        continue
    fi

    case $volba in
        1) secti ;;
        2) odeber ;;
        3) nasob ;;
        4) del ;;
        *) echo "Neplatná volba. Prosím, vyberte platnou operaci (1/2/3/4/5)."
    esac
done
