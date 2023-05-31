/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef IOCONFIG_H_
#define IOCONFIG_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>

#include <IO_LIB.h>


/* Constants */


/* Datatypes */
typedef struct iocIOParam
{
	unsigned char io_type;
	unsigned char master_nr;
	unsigned char slave_nr;
	unsigned char module_adr;
	unsigned char intern_off;
	unsigned char mode;
	unsigned char data_len;
	unsigned char reserve;
	unsigned long data_adr;
} iocIOParam;



/* Datatypes of function blocks */
typedef struct IOC2003
{
	/* VAR_INPUT (analogous) */
	unsigned char Slot;
	unsigned char SubSlot;
	unsigned char ConfigWord;
	unsigned long pData;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	unsigned char intern_off;
	unsigned char mode;
	signed long state;
	signed long old_state;
	struct IO_alloc IOalloc;
	struct IO_mphydef IOmphydef;
	struct IO_mphydef IOmphydefc;
	struct IO_data IOdata;
	struct IO_free IOfree;
	struct IO_ptest IOptest;
	struct iocIOParam IOPstructure;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit ReadWrite;
} IOC2003_typ;

typedef struct IOCGeneral
{
	/* VAR_INPUT (analogous) */
	unsigned char IO_type;
	unsigned char Slave_nr;
	unsigned char Slot;
	unsigned char Offset;
	unsigned char DataLen;
	unsigned long pData;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	unsigned char mode;
	signed long state;
	signed long old_state;
	struct IO_alloc IOalloc;
	struct IO_mphydef IOmphydef;
	struct IO_mphydef IOmphydefc;
	struct IO_data IOdata;
	struct IO_free IOfree;
	struct IO_ptest IOptest;
	struct iocIOParam IOPstructure;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit ReadWrite;
	plcbit DataState;
} IOCGeneral_typ;



/* Prototyping of functions and function blocks */
void IOC2003(IOC2003_typ* inst);
void IOCGeneral(IOCGeneral_typ* inst);



#endif /* IOCONFIG_H_ */

