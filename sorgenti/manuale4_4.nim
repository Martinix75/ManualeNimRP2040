import picostdlib/[stdio, gpio, i2c, time]
import display1602

stdioInitAll()
setupI2c(i2c0, 0.Gpio, 1.Gpio,100_000, true)

let lcd = newDisplay(i2c=i2c0, lcdAdd=0x27, numColum=16, numLines=2)
#various printing tests

while true:
  lcd.clear()
  lcd.moveto(0,0)
  lcd.putString("Ciao da Nim")
  lcd.moveTo(7,1)
  lcd.putChar('#')
  sleep(2000)
  lcd.clear()
  lcd.centerString(disp1602Ver)
  lcd.moveto(0,1)
  lcd.shiftString("-->", dir=false, cross=true, effect=1)
  sleep(2000)
  lcd.moveto(0,0)
  lcd.clearLine()
  sleep(2000)
  lcd.backLightOff()
  sleep(2000)
