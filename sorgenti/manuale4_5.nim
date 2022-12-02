import picostdlib/[gpio, i2c, time]
import ssd1306


#stdioInitAll()
sleep(2000)
#print("Partenza...")
setupI2c(blokk=i2c1,psda=2.Gpio, pscl=3.Gpio, freq=100_000)
let oled = newSsd1306I2C(i2c=i2c1, lcdAdd=0x3C, width=128, height=64)
oled.clear(0)
oled.rect( x=5 ,y=5, width=18, height=15, color=1, fill=false)
oled.circle(xCenter=114, yCenter=15, radius=12, color=1)
oled.text(text="Driver for", x=35 ,y=17, color=1)
oled.text(text="NIM", x=55 ,y=30 , color=1, charType="test")
oled.text(text="Version:" & ssd1306Ver , 30 ,45 ,1, charType="test")
oled.vline(x=5, y=40, height=18, color=1)
oled.hline(x=5, y=35 , width=18, color=1)
oled.line(xStr=7, yStr=37, xEnd=30, yEnd=53, color=1)
oled.show()
sleep(3000)
oled.invert(1)
sleep(3000)
oled.powerOff()
sleep(2000)
oled.powerOn()
sleep(2000)
oled.text(text="Version:" & ssd1306Ver , 30 ,45 ,color=0, charType="test")
oled.show()

