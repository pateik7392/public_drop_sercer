#!/bin/bash

while true; do
    clear
    echo "Text Editor"
    echo "1. Create or Edit a File"
    echo "2. Quit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter the filename: " filename
            nano "$filename"
            ;;
        2)
            echo "Goodbye!"
            exit
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
