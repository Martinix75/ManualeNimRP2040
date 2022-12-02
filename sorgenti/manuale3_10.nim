import picostdlib/[gpio, time,  i2c]
#import std/[strformat, math]

#stdioInitAll()
sleep(2000)
setupI2c(i2c1, 18.Gpio, 19.Gpio, 50_000, true)
#[
var i2cBlok = i2c1 #5
i2cBlok.init(50_000)
18.Gpio.setFunction(I2C)
18.Gpio.pullUp()#disablePulls()
19.Gpio.setFunction(I2C)
19.Gpio.pullUp() ]#

let numero: byte = 75
let indirzzoEl1 = numero.unsafeAddr
while true:
  writeBlocking(i2c1, 0x50, indirzzoEl1, 1, true)
  sleep(5)
#[
let frase = "ciao"
let indirzzoEl1 = frase[0].unsafeAddr
let noElem = csize_t(frase.len*sizeof(frase[0]))
while true:
  writeBlocking(i2cBlok, 0x50, indirzzoEl1, noElem, true)
  sleep(5)
]#
