import time

def zacit_hru():
    print("Vítejte v textové adventuře!")
    time.sleep(1)
    print("Jste v temném lese. Před sebou vidíte dvě cesty.")
    time.sleep(1)
    print("1. Cesta doleva")
    time.sleep(1)
    print("2. Cesta doprava")
    volba = input("Zvolte cestu (1/2): ")

    if volba == "1":
        cesta_doleva()
    elif volba == "2":
        cesta_doprava()
    else:
        print("Neplatná volba. Zkus to znovu.")
        zacit_hru()

def cesta_doleva():
    print("Vybrali jste se cestou doleva a narazili jste na řeku.")
    time.sleep(1)
    print("Co budete dělat?")
    time.sleep(1)
    print("1. Plavat řekou")
    time.sleep(1)
    print("2. Hledat most")
    volba = input("Zvolte akci (1/2): ")

    if volba == "1":
        print("Bohužel, řeka byla příliš silná, a utonuli jste. Konec hry.")
    elif volba == "2":
        print("Našli jste most a bezpečně jste přešli řeku.")
        vyhra()
    else:
        print("Neplatná volba. Zkus to znovu.")
        cesta_doleva()

def cesta_doprava():
    print("Vybrali jste se cestou doprava a dostali jste se k jeskyni.")
    time.sleep(1)
    print("Co budete dělat?")
    time.sleep(1)
    print("1. Vstoupit do jeskyně")
    time.sleep(1)
    print("2. Vrátit se zpět")
    volba = input("Zvolte akci (1/2): ")

    if volba == "1":
        print("Bohužel, uvnitř jeskyně byl drak, který vás snědl. Konec hry.")
    elif volba == "2":
        zacit_hru()
    else:
        print("Neplatná volba. Zkus to znovu.")
        cesta_doprava()

def vyhra():
    print("Gratulujeme! Bezpečně jste dokončili adventuru a vyhráli hru.")

# Spuštění hry
zacit_hru()
