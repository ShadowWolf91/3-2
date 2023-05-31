 
[hardwarekonfig]
wurzel: 1
[1.1]
spi: OBJEKTID=7
{1.3}
klasse: "HC_Moduluebersicht.Class"
name: _PRJ-Moduluebersicht
[3.1]
[3.100]
moduladr: 1
modulname: Display
art: SUBKOMPONENTE
{3.101}
klasse: "4P304000490dis"
[4.1]
[4.100]
moduladr: 2
modulname: Memcard
art: SUBKOMPONENTE
steckplatzgrp: "sysbus"
steckplatzinfo: NUMMER=1, MODULID=0, FLAGS=0
{4.101}
klasse: "PPMemcard"
{7.2}
klasse: "HC_SPS.Class"
familie: 3000
[7.1]
spi: OBJEKTID=2
[5.1]
[5.100]
moduladr: 0
modulname: ScrewIn Modules
art: SUBKOMPONENTE
steckplatzgrp: "sysbus"
steckplatzinfo: NUMMER=1, MODULID=11, FLAGS=1
steckplatzinfo: NUMMER=2, MODULID=0, FLAGS=0
steckplatzinfo: NUMMER=3, MODULID=27, FLAGS=1
steckplatzgrp: "subbus"
steckplatzinfo: NUMMER=1, MODULID=28, FLAGS=1
steckplatzinfo: NUMMER=2, MODULID=0, FLAGS=0
steckplatzinfo: NUMMER=3, MODULID=0, FLAGS=0
{5.101}
klasse: "PPScrewIn"
[11.1]
[11.100]
moduladr: 0
slotnr: 1
version: 1.0.0.0
[11.101]
{11.1824}
klasse: "7DO135.7"
[27.1]
[27.100]
moduladr: 0
slotnr: 3
version: 1.0.0.0
[27.101]
{27.1824}
klasse: "7AI354.7"
[28.1]
[28.100]
moduladr: 1
slotnr: 1
version: 1.0.0.0
[28.101]
{28.1824}
klasse: "7AO352.7"
[6.1]
[6.100]
moduladr: 2
modulname: IO
version: 1.0.0.0
art: SUBKOMPONENTE
{6.101}
klasse: "PPio"
[2.1]
[2.100]
moduladr: 0
modulname: CPU
version: 1.0.0.0
steckplatzgrp: "sysbus"
steckplatzinfo: NUMMER=1, MODULID=3, FLAGS=1
steckplatzinfo: NUMMER=2, MODULID=4, FLAGS=1
steckplatzinfo: NUMMER=3, MODULID=0, FLAGS=0
steckplatzgrp: "iobus"
steckplatzinfo: NUMMER=1, MODULID=5, FLAGS=3
steckplatzinfo: NUMMER=2, MODULID=5, FLAGS=2
steckplatzinfo: NUMMER=3, MODULID=6, FLAGS=3
steckplatzinfo: NUMMER=4, MODULID=6, FLAGS=2
anschlussgrp: "ser1"
anschlussinfo: NUMMER=1, MODULID=0, FLAGS=0
anschlussgrp: "canio2"
anschlussinfo: NUMMER=1, MODULID=0, FLAGS=0
[2.101]
[2.106]
comparam_canio2: BAUD=500000, IDLEN=11
inaparam_canio2: NODENO=0, NODECOUNT=32, BASEID=1598
ioparam_canio2: IOTIMEOUT=1000, SLAVETIMEOUT=8000, REPCOUNT=3, ANPCOUNT=80, PRI=1
[2.109]
comparam_ser1: 57600,e,8,1, TYPE="RS232", RIT=5, FORCE
inaparam_ser1: FORCE,NODENUMBER=2, PORTNUMBER=11159
modemparam_ser1: 57600,n,8,1, RIT=255
modeminit_ser1: STRING=ATS0=1
modemescape_ser1: SEQUENCE=+++
modemdelay_ser1: RESPONSE=2500
{2.108}
klasse: "PP41"
