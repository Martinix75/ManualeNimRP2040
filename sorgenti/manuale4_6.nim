import picostdlib/[gpio, i2c, time, stdio]
import pcf8574

stdioInitAll()
setupI2c(i2c1, 2.Gpio, 3.Gpio, 50_000, true)
let expander = newExpander(blokk = i2c1, expAdd = 0x20)
var readBuffer = [byte(0)] #make array uint8 (ini = 0)
while true:
  expander.readByte(readBuffer)
  print("Sul Regostro del pcf8574 ce: " & $readBuffer)
  var valBuffer = not readBuffer[0]
  print("Registro invertito: " & $valBuffer)
  if valBuffer == 1:
    print("Hai premouto il tasto 1 (bit0)")
  elif valBuffer == 128:
    print("Hai premouto il tasto 2 (bit7)")
  elif valBuffer == 129:
    print("Hai premouto il tasto 1 e 2 assieme!")
  sleep(500)
  
  
  
  
#[while true:
  let bit0 = expander.readBit(p0)
  let bit7 = expander.readBit(p7)
  if bit0 == false and bit7 == false:
    print("Hai premouto il tasto 1 e 2 assieme!")
  elif bit0 == false:
    print("Hai premouto il tasto 1 (bit0)")
  elif bit7 == false:
    print("Hai premouto il tasto 2 (bit7)")
  
  sleep(500)
]#
#[
# bit di uscita!!
setupI2c(i2c1, 2.Gpio, 3.Gpio, 50_000, true)
let expander = newExpander(blokk = i2c1, expAdd = 0x20)
expander.writeByte(data=0xAA) #10101010=170
sleep(2500)
expander.writeBit(p0, on)
sleep(1500)
expander.writeBit(p2, on)
sleep(2500)
expander.writeByte(data=0x55) #01010101=85
sleep(2000)
expander.setLow()
sleep(2000)
expander.setHigh()
]#
