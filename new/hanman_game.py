import random

def draw_hangman(incorrect_guesses):
    stages = [
        """
           --------
           |      |
           |      O
           |     \|/
           |      |
           |     / \
           -
        """,
        # ... (other stages omitted for brevity)
    ]

    print(stages[incorrect_guesses])

def get_random_word():
    words = ["python", "hangman", "programming", "coding", "game"]
    return random.choice(words)

def hangman_game():
    word = get_random_word()
    guessed_word = ["_"] * len(word)
    incorrect_guesses = 0
    max_incorrect_guesses = len(stages) - 1

    print("Welcome to Hangman!")

    while incorrect_guesses < max_incorrect_guesses:
        guess = input("Guess a letter: ").lower()

        if guess in word:
            for i in range(len(word)):
                if word[i] == guess:
                    guessed_word[i] = guess
            print(" ".join(guessed_word))
        else:
            incorrect_guesses += 1
            draw_hangman(incorrect_guesses)

        if "_" not in guessed_word:
            print("Congratulations, you guessed the word: {}".format(word))
            break

    if incorrect_guesses == max_incorrect_guesses:
        print("Unfortunately, the game is over. The correct word was: {}".format(word))

hangman_game()
