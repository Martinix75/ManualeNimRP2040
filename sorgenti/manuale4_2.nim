import picostdlib/[gpio, time,  stdio, ]
import picousb
from strutils import split, toLowerAscii

stdioInitAll()
sleep(2000)
print("PicoUsb Ver: " & picousbVer)
const protocol = "0.1.0"

let serialUsb = PicoUsb()
setupGpio(led1, 0.Gpio, true)
setupGpio(led2, 1.Gpio, true)
while true:
  if serialUsb.isReady == true:
    let stringa = serialUsb.readLine
    let splitStringa = stringa.split('#')
    #print($splitStringa[1])
    if splitStringa[0].toLowerAscii() == "led1":
      print("Led1 Attivato..")
      let numeroRipetizioni = serialUsb.toInt(splitStringa[1])
      for _ in countup(1, numeroRipetizioni):
        led1.put(High)
        sleep(200)
        led1.put(Low)
        sleep(800)
    elif splitStringa[0].toLowerAscii() == "led2":
      print("Led1 Attivato..")
      let numeroRipetizioni = serialUsb.toInt(splitStringa[1])
      for _ in countup(1, numeroRipetizioni):
        print("Led2 Attivato..")
        led2.put(High)
        sleep(400)
        led2.put(Low)
        sleep(600)
    elif splitStringa[0].toLowerAscii() == "version":
      print("Protocol Version: " & protocol)
    else:
      print("Comando Errato! Ripeti!")

  #[if serialUsb.isReady == true:
    let stringa = serialUsb.readLine
    let nuLamp = serialUsb.toInt(stringa)
    for _ in countup(1, nuLamp):
      led1.put(High)
      sleep(300)
      led1.put(Low)
      sleep(700)]#
