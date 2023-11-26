import random

def number_guessing():
    number = random.randint(1, 100)  # Generate a random number between 1 and 100.
    attempts = 0

    print("Welcome to the Number Guessing Game!")
    print("You have 5 attempts to guess the random number between 1 and 100.")

    while attempts < 5:
        guess = int(input("Enter a number: "))

        attempts += 1

        if guess < number:
            print("The entered number is smaller than the target.")
        elif guess > number:
            print("The entered number is larger than the target.")
        else:
            print(f"Congratulations! You guessed the number {number} in {attempts} attempts.")
            break

    if guess != number:
        print(f"Sorry, you're out of attempts. The target number was {number}.")

    play_again = input("Do you want to play again? (yes/no): ")
    if play_again.lower() == "yes":
        number_guessing()
    else:
        print("Thank you for playing!")

number_guessing()
