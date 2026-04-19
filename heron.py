z = input('Wurzelzahl (z) eingeben: ')
x = input('Zahl 1 (x) eingeben: ')
y = input('Zahl 2 (y) eingeben: ')
s = input('Anzahl Schritte (s) eingeben: ')

try:
    z = int(z)
    x = float(x.replace(',', '.'))
    y = float(y.replace(',', '.'))
    s = int(s)

except:
    print('\nMindestens ein Wert ist keine gültige Zahl')
    input('\n-> Programm beendet')
    

def heron(wz, x, y, s):
    for i in range(s):
        x = (x + y) / 2
        y = wz / x
        print(f'Schritt {i+1}: {x} (x), {y} (y)')

print('')
heron(z, x, y, s)
input('\n-> Programm beendet')
