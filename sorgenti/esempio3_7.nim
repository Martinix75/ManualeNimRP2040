import picostdlib/[gpio, time, stdio]
import std/[math]

setupGpio(led1, 0.Gpio, true)
setupGpio(pulsante1, 17.Gpio, false); pulsante1.pullUp()
setupGpio(pulsante2, 20.Gpio, false); pulsante2.pullUp()
stdioInitAll()
    
proc accendiLed(pin: Gpio, events: set[IrqLevel])  {.cdecl.} =
  led1.put(High)
  print("Led Acceso")

enableIrqWithCallback(17.Gpio, {IrqLevel.rise}, true, accendiLed)

while true:
  print("inizio..")
  led1.put(Low)
  var lista:seq[int]
  var somma:int
  for numero in 0..50:
    lista.add(numero^2)
    print("Valore Istantaneo: " & $(numero^2))
    sleep(250)
  somma = lista.sum()
  print("Valore Finale: " & $somma)
