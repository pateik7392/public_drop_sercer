import time
import random

coiny = 0  # Přidali jsme proměnnou pro sledování počtu coinů.

lektvar_obra = False

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
    global coiny  # Přidali jsme globální proměnnou pro coinů.

    print("Vybrali jste se cestou doleva a narazili jste na řeku.")
    time.sleep(1)
    print("Co budete dělat?")
    time.sleep(1)
    print("1. Plavat řekou")
    time.sleep(1)
    print("2. Hledat most")
    time.sleep(1)
    print("3. Jít ke korytu řeky")
    volba = input("Zvolte akci (1/2/3): ")

    if volba == "1":
        print("Bohužel, řeka byla příliš silná, a utonuli jste. Konec hry.")
    elif volba == "2":
        print("Našli jste most, ale je rozbitý. Co budete dělat?")
        time.sleep(1)
        print("1. Skusím to proskákat")
        time.sleep(1)
        print("2. Vrátit se")
        volba_most = input("Zvolte akci (1/2): ")
        if volba_most == "1":
            print("Bohužel, pokus o proskočení mostu selhal a upadli jste do řeky. Konec hry.")
        elif volba_most == "2":
            cesta_doleva()
        else:
            print("Neplatná volba. Zkus to znovu.")
            cesta_doleva()
    elif volba == "3":
        print("Rozhodli jste se jít ke korytu řeky.")
        print("Našli jste jiný most a bezpečně jste přešli řeku.")
        coiny += 10  # Hráč získá 10 coinů za překonání řeky.
        vesnice_nebo_obr()
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
        print("Uvnitř jeskyně byl hladový obr.")
        if lektvar_obra:
            print("Díky lektvaru obra jste chráněni, obr nemůže udělat vůči vám žádnou škodu.")
            time.sleep(1)
            print("Stali jste se obrem a společně jste se obora najedli. Vyhráli jste hru!")
            exit()
        else:
            time.sleep(1)
            rozhodnuti = random.choice(["obora sní", "obora rozmačká", "obora zašlape"])
            print(f"Obr učinil rozhodnutí: {rozhodnuti}")
            if "sní" in rozhodnuti:
                print("Stali jste se obrem a společně jste se obora najedli. Vyhráli jste hru!")
                exit()
            elif "rozmačká" in rozhodnuti:
                print("Obr byl příliš silný a rozmačkal vás. Konec hry.")
                exit()
            elif "zašlape" in rozhodnuti:
                print("Obr vás zašlápl. Konec hry.")
                exit()
    elif volba == "2":
        zacit_hru()
    else:
        print("Neplatná volba. Zkus to znovu.")
        cesta_doprava()

def vesnice_nebo_obr():
    print("Po překonání mostu se ocitáte na křižovatce.")
    time.sleep(1)
    print("Před vámi jsou další dvě cesty:")
    time.sleep(1)
    print("1. Cesta vedoucí k vesnici")
    time.sleep(1)
    print("2. Cesta vedoucí k obrovu")
    volba = input("Zvolte cestu (1/2): ")

    if volba == "1":
        print("Rozhodli jste se jít k vesnici.")
        vesnice()
    elif volba == "2":
        print("Rozhodli jste se jít k obrovu.")
        obchodnik_obr()
    else:
        print("Neplatná volba. Zkus to znovu.")
        vesnice_nebo_obr()

def vesnice():
    print("Přišli jste do vesnice a obyvatelé vás vřele přivítali.")
    time.sleep(1)
    print("Gratulujeme, vyhráli jste tuto textovou adventuru!")
    exit()

def obchodnik_obr():
    global coiny  # Přidali jsme globální proměnnou pro coinů.

    print("Přišli jste k obrovi, ale překvapivě jste narazili na obchodníka.")
    time.sleep(1)
    print("Obchodník nabízí lektvar obra za 50 coinů, který vás zvětší. Co budete dělat?")
    time.sleep(1)
    print("1. Koupit lektvar obra")
    time.sleep(1)
    print("2. Ignorovat obchodníka")
    volba = input("Zvolte akci (1/2): ")

    if volba == "1":
        if coiny >= 50:
            coiny -= 50  # Odebrání 50 coinů za nákup lektvaru obra.
            global lektvar_obra
            lektvar_obra = True
            print("Koupili jste lektvar obra a zvětšili své schopnosti.")
            time.sleep(1)
            print("Nyní jste připraveni čelit obrovi.")
            cesta_doprava()
        else:
            print("Nemáte dostatek coinů na zakoupení lektvaru obra.")
            obchodnik_obr()
    elif volba == "2":
        print("Rozhodli jste se obchodníka ignorovat a pokračovat k obrovi.")
        cesta_doprava()
    else:
        print("Neplatná volba. Zkus to znovu.")
        obchodnik_obr()

zacit_hru()
