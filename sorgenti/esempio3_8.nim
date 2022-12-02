import picostdlib/[gpio, time, stdio, watchdog]

#[
stdioInitAll()
sleep(2000)
while true:
  if watchdogCausedReboot() == true:
    print("reboot da watchdog " & '\n')
  else:
    print("Pulzia del Boot" & '\n')
  watchdogEnable(200, true)
  for i in countup(0,5):
    print("Aggiornalmento Watchdog " & $i )
    watchdogUpdate()
  print("Aspetto per ilr eboot dal wD" & '\n')
  while true:
    sleep(50)
]#

setupGpio(led1, 0.Gpio, true)
stdioInitAll()
sleep(3000)
print("Partenza..")

for _ in 0..5:
  led1.put(High)
  sleep(5)
  led1.put(Low)
  sleep(195)

if watchdogCausedReboot() == true:
  print("Entro nel Ciclo da 3s causa reset WD")
  while true:
    for _ in 0..2: #ciclo in 3s
      led1.put(High)
      sleep(920)
      led1.put(Low)
      sleep(80)
    watchdogUpdate()
else:
  watchdogEnable(4000, true) #max 8.3s
  print("Watchdog Abilitato a 4s")
  while true:
    print("Entro nel Ciclo da 5s tutto Ok")
    for _ in 0..4: #ciclo in 5s
      led1.put(High)
      sleep(50)
      led1.put(Low)
      sleep(950)
    watchdogUpdate()
  
#[
while true:
  if watchdogCausedReboot() == true:
    print("Cazzo")
    while true:
      print("Entro nel Ciclo da 3s")
      for _ in 0..2: #ciclo in 3s
        led1.put(High)
        sleep(950)
        led1.put(Low)
        sleep(50)
      watchdogUpdate()
  else:
    print("Figa")

  watchdogEnable(4000, true) #max 8.3s
  print("Watchdog Abilitato a 4s")
  while true:
    print("Entro nel Ciclo da 5s")
    for _ in 0..4: #ciclo in 5s
      led1.put(High)
      sleep(50)
      led1.put(Low)
      sleep(950)
    watchdogUpdate()
    

setupGpio(led1, 0.Gpio, true)
for _ in 0..5:
  led1.put(High)
  sleep(5)
  led1.put(Low)
  sleep(195)

watchdogEnable(3000, true) #max 8.3s
while true:
  for _ in 0..5: #ciclo in 2.5s
    led1.put(High)
    sleep(50)
    led1.put(Low)
    sleep(950)
  watchdogUpdate()
]#
