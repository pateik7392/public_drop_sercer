def metry_na_palce(metry):
    return metry * 39.37

metry = float(input("Zadejte délku v metrech: "))
palce = metry_na_palce(metry)
print(f"{metry} metrů = {palce} palců")
