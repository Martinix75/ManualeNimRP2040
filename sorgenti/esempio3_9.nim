import picostdlib/[gpio, time, stdio, multicore]
import std/[strformat, math]


stdioInitAll()
sleep(2000)

print("Partenza..")
# ---------- Core1 ----------
proc alCore1() {.cdecl.} =
  var 
    numElemLC1: uint32
    listC1 = newSeq[uint32](0)
    sumListC1: uint32
    
  if multicoreFifoRvalid() == true:
    numElemLC1 = multicoreFifoPopBlocking()
    multicoreFifoDrain()
  
  print("Creo Sequenza Core1 \n")
  for y in countup(uint32(1), numElemLC1):#16
    listC1.add(y)
    sleep(50)
    #print(fmt"L2: {listC1}")
    
  sumListC1 = sum(listC1)
  print(fmt"Somma Lista2: {sumListC1}")#=20100
  
  if multicoreFifoRvalid() == false:
    multicoreFifoPushBlocking(sumListC1)
    
# ---------- Core0 ----------
const
  lenListC0: uint32 = 100
  lenListC1: uint32 = 200
  
multicoreResetCore1()#26
multicoreLaunchCore1(alCore1)
if multicoreFifoRvalid() == false:#28
  multicoreFifoPushBlocking(lenListC1)

var 
  listC0 = newSeq[uint32](0)
  sumListC1: uint32
  sumListC0: uint32
  
print("Creo Sequenza Core0 \n")
for x in countup(uint32(1), lenListC0):
  listC0.add(uint32(sqrt(float(x)))) #36
  #print(fmt"L1: {listC0}")
  sleep(20)
  
sumListC0 = sum(listC0)
print(fmt"Somma Lista1: {sumListC0}")#=625
multicoreFifoDrain() #40

while true: #41
  if multicoreFifoRvalid() == true:
    sumListC1=multicoreFifoPopBlocking()
    print(fmt"La Somma L1+L2 --> {sumListC1+sumListC0}") #=20725
    #multicoreFifoDrain()
    break
  
print("-- Fine Processo --")

#[
setupGpio(led1, 0.Gpio, true)
setupGpio(led2, 1.Gpio, true)
stdioInitAll()

proc lampeggio2() {.cdecl.} =
  while true:
    print("Lampeggio su Core1") #core1 Non stampa su usb!
    led2.put(High)
    sleep(150)
    led2.put(Low)
    sleep(500)

multicoreResetCore1()
multicoreLaunchCore1(lampeggio2)

while true:
  print("Lampeggio su Core0")
  led1.put(High)
  sleep(300)
  led1.put(Low)
  sleep(700)
]#
