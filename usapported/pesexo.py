import pygame
import random

pygame.init()

width, height = 800, 600
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption("Memory Game")

white = (255, 255, 255)
black = (0, 0, 0)

def draw_cards(cards):
    for card in cards:
        pygame.draw.rect(screen, white, card)

def pexeso_game():
    card_width, card_height = 50, 50
    cards = [pygame.Rect(x, y, card_width, card_height) for x in range(0, width, card_width + 10) 
             for y in range(0, height, card_height + 10)]

    random.shuffle(cards)

    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        screen.fill(black)
        draw_cards(cards)

        pygame.display.flip()

    pygame.quit()

pexeso_game()
