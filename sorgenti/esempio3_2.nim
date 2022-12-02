import picostdlib/[gpio, time]

const led1 = 0.Gpio
led1.init()
led1.setDir(Out)

const pulsante1 = 17.Gpio
pulsante1.init()
pulsante1.setDir(In)

const pulsante2 = 20.Gpio; pulsante2.init(); pulsante2.setDir(In)
var flag: bool = false

while true:
  if pulsante1.get() == 0.Value or flag == true:
    led1.put(High)
    sleep(300)
    led1.put(Low)
    flag = true
    sleep(700)
  if pulsante2.get() == Low:
    led1.put(Low)
    flag = false
