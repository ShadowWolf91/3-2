 
[hardwarekonfig]
wurzel: 2
[2.1]
spi: OBJEKTID=3
{2.3}
klasse: "HC_Moduluebersicht.Class"
name: _PRJ-Moduluebersicht
[223.1]
[223.100]
moduladr: 0
modulname: CPU
version: 1.0.0.0
steckplatzgrp: "sysbus"
steckplatzinfo: NUMMER=1, MODULID=224, FLAGS=1
steckplatzinfo: NUMMER=2, MODULID=225, FLAGS=1
steckplatzinfo: NUMMER=3, MODULID=0, FLAGS=0
steckplatzgrp: "iobus"
steckplatzinfo: NUMMER=1, MODULID=226, FLAGS=3
steckplatzinfo: NUMMER=2, MODULID=226, FLAGS=2
steckplatzinfo: NUMMER=3, MODULID=227, FLAGS=3
steckplatzinfo: NUMMER=4, MODULID=227, FLAGS=2
anschlussgrp: "ser1"
anschlussinfo: NUMMER=1, MODULID=0, FLAGS=0
anschlussgrp: "canio2"
anschlussinfo: NUMMER=1, MODULID=0, FLAGS=0
[223.101]
[223.106]
comparam_canio2: BAUD=500000, IDLEN=11
inaparam_canio2: NODENO=0, NODECOUNT=32, BASEID=1598
ioparam_canio2: IOTIMEOUT=1000, SLAVETIMEOUT=8000, REPCOUNT=3, ANPCOUNT=80, PRI=1
[223.109]
comparam_ser1: 57600,e,8,1, TYPE="RS232", RIT=5, FORCE
inaparam_ser1: FORCE,NODENUMBER=2, PORTNUMBER=11159
modemparam_ser1: 57600,n,8,1, RIT=255
modeminit_ser1: STRING=ATS0=1
modemescape_ser1: SEQUENCE=+++
modemdelay_ser1: RESPONSE=2500
{223.108}
klasse: "PP41"
[224.1]
[224.100]
moduladr: 1
modulname: Display
art: SUBKOMPONENTE
{224.101}
klasse: "4P304000490dis"
[225.1]
[225.100]
moduladr: 2
modulname: Memcard
art: SUBKOMPONENTE
steckplatzgrp: "sysbus"
steckplatzinfo: NUMMER=1, MODULID=0, FLAGS=0
{225.101}
klasse: "PPMemcard"
[226.1]
[226.100]
moduladr: 0
modulname: ScrewIn Modules
art: SUBKOMPONENTE
steckplatzgrp: "sysbus"
steckplatzinfo: NUMMER=1, MODULID=0, FLAGS=0
steckplatzinfo: NUMMER=2, MODULID=0, FLAGS=0
steckplatzinfo: NUMMER=3, MODULID=0, FLAGS=0
steckplatzgrp: "subbus"
steckplatzinfo: NUMMER=1, MODULID=0, FLAGS=0
steckplatzinfo: NUMMER=2, MODULID=0, FLAGS=0
steckplatzinfo: NUMMER=3, MODULID=0, FLAGS=0
{226.101}
klasse: "PPScrewIn"
[227.1]
[227.100]
moduladr: 2
modulname: IO
version: 1.0.0.0
art: SUBKOMPONENTE
{227.101}
klasse: "PPio"
[3.1]
spi: OBJEKTID=223
{3.2}
klasse: "HC_SPS.Class"
familie: 3000
