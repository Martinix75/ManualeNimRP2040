import picostdlib/[gpio, time, pwm, stdio, adc]
import std/[math, strformat]

stdioInitAll()
adcInit()

#selectInput(AdcTemp)
#selectInput(Adc26)

0.Gpio.setFunction(PWM)
let pwmOut = toSliceNum(0.Gpio)
pwmout.setClockDivide(251)
pwmOut.setWrap(2002)
pwmOut.setEnabled(true)

enableTempSensor(true)
let voltPerStep = 3.3 / 4095 #calcola il valore di tensione
while true:
  selectInput(AdcTemp)
  let convLettraVolt = float(adcRead()) * voltPerStep #trasforma il valore numerico in valore tensione effettivo
  let gradi = round(27 - ((convLettraVolt - 0.706) / 0.001721), 2)
  let gradSemplificato = 27 - (581.06 * (convLettraVolt - 0.706))
  #print("Valore tensione: " & $(convLettraVolt) )
  print("----------------------")
  print(fmt "Temp:  {gradi: 0.2f}")
  #print("TempSemplif: " & $gradSemplificato)
  selectInput(Adc26)
  let valRes = adcRead()
  let valPwm: uint16 = uint16(float(valRes)*0.488)
  print(fmt"Il Valore Resitivo e':  {(uint16(float(valRes)*2.44))}  Ohm")
  #print("Il Valore Resitivo e': " & $(uint16(float(valRes)*2.44)) & "Ohm")
  print("----------------------")
  pwmOut.setChanLevel(A, valPwm)
  sleep(300)

#[stdioInitAll()
adcInit()
0.Gpio.setFunction(PWM)
let pwmOut = toSliceNum(0.Gpio)
pwmout.setClockDivide(251)
pwmOut.setWrap(2002)
pwmOut.setEnabled(true)

#let ingAnalogico = 26.Gpio
#ingAnalogico.init()
selectInput(Adc26)
while true:
  let valRes = adcRead()
  let valPwm: uint16 = uint16(float(valRes)*0.488)
  print("Il Valore Numerico e': " & $(valRes))
  print("Il Valore Resitivo e': " & $(uint16(float(valRes)*2.44)) & "Ohm")
  pwmOut.setChanLevel(A, valPwm)
  sleep(100)]#
