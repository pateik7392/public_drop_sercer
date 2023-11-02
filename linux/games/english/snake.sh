#!/bin/bash

# Initialize the game board
rows=20
cols=40
snake="3 4 2 4 1 4"  # Initial snake position
food_row=10
food_col=20
score=0
gameover=0

# Function to draw the game board
draw_board() {
    clear
    for ((i = 0; i < rows; i++)); do
        for ((j = 0; j < cols; j++)); do
            if [[ $i -eq 0 || $i -eq $((rows - 1)) || $j -eq 0 || $j -eq $((cols - 1)) ]]; then
                echo -n "#"
            elif [[ $i -eq $food_row && $j -eq $food_col ]]; then
                echo -n "@"
            else
                local is_snake_part=0
                for part in $snake; do
                    local part_row=$((part / cols))
                    local part_col=$((part % cols))
                    if [[ $i -eq $part_row && $j -eq $part_col ]]; then
                        echo -n "*"
                        is_snake_part=1
                        break
                    fi
                done
                [[ $is_snake_part -eq 0 ]] && echo -n " "
            fi
        done
        echo
    done
    echo "Score: $score"
}

# Function to move the snake
move_snake() {
    local head_row=$((snake))
    local head_col=$((snake))
    local new_head_row=$((head_row))
    local new_head_col=$((head_col))
    case $direction in
        w)  new_head_row=$((head_row - 1));;
        a)  new_head_col=$((head_col - 1));;
        s)  new_head_row=$((head_row + 1));;
        d)  new_head_col=$((head_col + 1));;
    esac

    snake="$new_head_row $new_head_col $snake"
    # Check for collision with food
    if [[ $new_head_row -eq $food_row && $new_head_col -eq $food_col ]]; then
        ((score++))
        food_row=$((RANDOM % (rows - 2) + 1))
        food_col=$((RANDOM % (cols - 2) + 1))
    else
        # Remove the tail of the snake
        local tail_row
        local tail_col
        for part in $snake; do
            tail_row=$((part / cols))
            tail_col=$((part % cols))
        done
        snake="${snake[@]:0: -1}"
    fi
}

# Main game loop
while [[ $gameover -eq 0 ]]; do
    draw_board
    read -n 1 -t 0.2 direction
    case $direction in
        w|a|s|d) move_snake;;
        q) gameover=1
           echo "Game over. Final score: $score"
           ;;
    esac
done
