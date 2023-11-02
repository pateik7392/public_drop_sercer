#!/bin/bash

comp_number=$((1 + RANDOM % 100))
attempts=5

echo "Welcome to the Guess the Number game!"
echo "You have $attempts attempts."

while [ $attempts -gt 0 ]; do
    read -p "Enter your guess (1-100): " guess

    if [ $guess -gt $comp_number ]; then
        echo "Your guess is too high."
    elif [ $guess -lt $comp_number ]; then
        echo "Your guess is too low."
    else
        echo "Congratulations, you guessed the number $comp_number."
        break
    fi

    ((attempts--))
    if [ $attempts -eq 0 ]; then
        echo "Sorry, you've run out of attempts."
        echo "The computer thought of the number $comp_number."
    else
        echo "You have $attempts attempts left."
    fi
done
