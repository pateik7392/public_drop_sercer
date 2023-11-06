#!/bin/bash

options=("Rock" "Paper" "Scissors")

# Generate a random computer move
compMove=$((1 + RANDOM % 3))

echo "Choose your move:"
for i in "${!options[@]}"; do
    echo "$((i + 1)). ${options[i]}"
done

read -p "Enter the number of your move: " choice
choice=$((choice - 1))

if [ "$choice" -eq "$compMove" ]; then
    echo "It's a tie!"
elif [ "$choice" -eq 0 ]; then
    if [ "$compMove" -eq 1 ]; then
        echo "Computer wins! Paper covers Rock."
    else
        echo "You win! Rock smashes Scissors."
    fi
elif [ "$choice" -eq 1 ]; then
    if [ "$compMove" -eq 0 ]; then
        echo "You win! Paper covers Rock."
    else
        echo "Computer wins! Scissors cut Paper."
    fi
elif [ "$choice" -eq 2 ]; then
    if [ "$compMove" -eq 0 ]; then
        echo "Computer wins! Rock smashes Scissors."
    else
        echo "You win! Scissors cut Paper."
    fi
else
    echo "Invalid choice. Please enter 1, 2, or 3."
fi
