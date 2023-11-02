#!/bin/bash

# Function to perform addition
add() {
    result=$((num1 + num2))
    echo "Result: $result"
}

# Function to perform subtraction
subtract() {
    result=$((num1 - num2))
    echo "Result: $result"
}

# Function to perform multiplication
multiply() {
    result=$((num1 * num2))
    echo "Result: $result"
}

# Function to perform division
divide() {
    if [ $num2 -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
    else
        result=$(awk "BEGIN {print $num1 / $num2}")
        echo "Result: $result"
    fi
}

# Main calculator loop
while true; do
    echo "Select an operation:"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Quit"
    read -p "Enter your choice (1/2/3/4/5): " choice

    if [ $choice -eq 5 ]; then
        echo "Goodbye!"
        break
    fi

    if [ $choice -ge 1 ] && [ $choice -le 4 ]; then
        read -p "Enter first number: " num1
        read -p "Enter second number: " num2
    else
        echo "Invalid choice. Please select a valid operation (1/2/3/4/5)."
        continue
    fi

    case $choice in
        1) add ;;
        2) subtract ;;
        3) multiply ;;
        4) divide ;;
        *) echo "Invalid choice. Please select a valid operation (1/2/3/4/5)."
    esac
done
