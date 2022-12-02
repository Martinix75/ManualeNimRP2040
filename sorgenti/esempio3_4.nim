import picostdlib/[gpio, time, pwm]


setupGpio(pulsante1, 17.Gpio, false);pulsante1.pullUp()
setupGpio(pulsante2, 20.Gpio, false); pulsante2.pullUp()

#setupGpio(led1, 0.Gpio, true)
0.Gpio.setFunction(PWM)
1.Gpio.setFunction(PWM)

var pwmOut = toSliceNum(0.Gpio)
pwmout.setClockDivide(2)
pwmOut.setWrap(253) #550hz con divisiuone a 255
#pwmOut.setChanLevel(A, 146)
#pwmOut.setChanLevel(B, 63)
pwmOut.setEnabled(true)

var
  valPwmA: uint16 = 1
  valPwmB: uint16 = 253
while true:
  if pulsante1.get() == 0.Value:
    valPwmA += 1
    if valPwmA > 253:
      valPwmA = 253
    valPwmB -= 1
    if valPwmB <= 1:
      valPwmB = 1
  if pulsante2.get() == Low:
    valPwmB += 1
    if valPwmB > 253:
      valPwmB = 253
    valPwmA -= 1
    if valPwmA <= 1:
      valPwmA = 1
  pwmOut.setChanLevel(A, valPwmA)
  pwmOut.setChanLevel(B, valPwmB)
  sleep(20)
#------------progaramma esempio 2------------
#[var
   valPwm: uint16 = 1
   
while true:
  if pulsante1.get() == 0.Value:
    valPwm += 1
    if valPwm > 979:
      valPwm = 979
  if pulsante2.get() == Low:
    valPwm -= 1
    if valPwm <= 1:
      valPwm = 1
  pwmOut.setChanLevel(A, valPwm) #x test poi via
  sleep(20)









#----------- per esempio 3--------------
setupGpio(led1, 0.Gpio, true) #true = OUT
led1.setFunction(PWM)
var pwmOut = led1.toSliceNum()
pwmout.setClockDivide(255)
const
  freq = 500 #in hertz
  ducy:uint16 = 28 #in percentuale
const 
  wrapok:uint16 = uint16((125_000_000 / (255*freq))-1) #calcolo wrap a partire dalla frequenza
  valch = uint16(int(ducy*wrapok) / 100)
  
pwmOut.setWrap(wrapok)
pwmOut.setChanLevel(A, valch)
pwmOut.setEnabled(true)


setupGpio(pulsante1, 17.Gpio, false);pulsante1.pullUp()
setupGpio(pulsante2, 20.Gpio, false); pulsante2.pullUp()

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
    flag = false]#
#dutys= (valoresetCahnnelLevel*vloresetWrap)/100
