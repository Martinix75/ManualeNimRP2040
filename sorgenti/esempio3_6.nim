import picostdlib/[gpio, time, stdio]

setupGpio(led1, 0.Gpio, true)
setupGpio(pulsante1, 17.Gpio, false); pulsante1.pullUp()
setupGpio(pulsante2, 20.Gpio, false); pulsante2.pullUp()
stdioInitAll()
var 
  #flag: bool = false
  pulsanteRilasciato: bool = true
  tempoAttuale: uint32 = 0
  tempoOn: uint32 = 3000000
  tempoOff: uint64 = 6000000
sleepMicroseconds(3000000)
print("init....")
while true:
  if pulsante1.get() == Low:# or flag == true:
    print("P1 premuto Ok")
    if pulsanteRilasciato == true:
      tempoAttuale = timeUs32()
      pulsanteRilasciato = false
      print("Preso tempo OK")
    if timeUs32()-tempoAttuale > tempoOn:
      print("On led")
      led1.put(High)
      pulsanteRilasciato = true

 
  if pulsante2.get() == Low:
    print("P2 premuto Ok")
    if pulsanteRilasciato == true:
      tempoAttuale = timeUs32()
      pulsanteRilasciato = false
      print("Preso tempo OK")
    if timeUs64()-tempoAttuale > tempoOff:
      print("Off Led")
      led1.put(Low)
      pulsanteRilasciato = true
  
  if pulsante1.get() == High and pulsante2.get() == High:
    tempoAttuale = timeUs32()
