#!/bin/bash

echo "Zadej číslo:"
read cislo

factorial=1
for ((i=1;i<=cislo;i++)); do
  factorial=$((factorial * i))
done

echo "Faktoriál čísla $cislo je $factorial"
