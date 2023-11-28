#!/bin/bash

echo "Zadej název adresáře:"
read adresar

mkdir $adresar
touch $adresar/soubor.txt

echo "Adresář a soubor vytvořeny."
