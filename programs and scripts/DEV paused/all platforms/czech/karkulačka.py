def kalkulacka():
    while True:
        try:
            cislo1 = float(input("Zadejte první číslo: "))
            cislo2 = float(input("Zadejte druhé číslo: "))
            operace = input("Zadejte operaci (+, -, *, /): ")

            if operace == '+':
                vysledek = cislo1 + cislo2
            elif operace == '-':
                vysledek = cislo1 - cislo2
            elif operace == '*':
                vysledek = cislo1 * cislo2
            elif operace == '/':
                vysledek = cislo1 / cislo2
            else:
                print("Neplatná operace")
                continue

            print("Výsledek: ", vysledek)
        except ValueError:
            print("Chybný vstup, zadejte platná čísla.")

kalkulacka()
