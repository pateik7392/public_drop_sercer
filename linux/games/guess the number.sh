#!/bin/bash

# Generate a random number between 1 and 100
secretNum=$((1 + RANDOM % 100))

echo "Welcome to the Guess the Number game!"
echo "I've picked a number between 1 and 100."
echo "Can you guess it?"

while true; do
    read -p "Enter your guess: " guessNum

    if [ "$guessNum" -lt "$secretNum" ]; then
        echo "Your guess is too low. Try again."
    elif [ "$guessNum" -gt "$secretNum" ]; then
        echo "Your guess is too high. Try again."
    else
        echo "Congratulations! You've guessed the correct number: $secretNum"
        break
    fi
done
