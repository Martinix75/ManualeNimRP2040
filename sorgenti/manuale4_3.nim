import picostdlib/[stdio, gpio, i2c, time]
import std/strformat
import random

stdioInitAll()
sleep(2000)
print(fmt"Inizio a generare numeri casuali..")
randomize()

let rnd = random(3)
print(fmt "Ho generato il numero (da 0..1):  {rnd: 0.3f}")

let intRnd = randomInt(2,30)
print(fmt"ho generato il numero casuale intero tra 2 e 30: {intRnd}")

let charRnd = randomChar()
print(fmt"Ho generato il carattere casuale:  {charRnd}")
