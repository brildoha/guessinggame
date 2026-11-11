#!/bin/bash
count_files() {
    find . -maxdepth 1 -type f | wc -l
}

correct_answer=$(count_files)
guessing_game() {
    echo "Welcome to the Guessing Game!"
    echo "How many files are in the current directory?"

    while true
    do
        read -p "Your guess: " guess

        if ! [[ "$guess" =~ ^[0-9]+$ ]]
        then
            echo "Please enter a valid number."
        elif [ "$guess" -lt "$correct_answer" ]
        then
            echo "Too low! Try again."
        elif [ "$guess" -gt "$correct_answer" ]
        then
            echo "Too high! Try again."
        else
            echo "Congratulations! You guessed correctly!"
            break
        fi
    done
}

guessing_game
