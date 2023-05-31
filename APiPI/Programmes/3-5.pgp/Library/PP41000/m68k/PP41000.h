/*

Generated header file for TPU function blocks
selected for module PP41000.

*/

#ifndef _PP41000_H_
#ifdef __cplusplus
extern "C" {
#endif
#define	_PP41000_H_

#include <bur/plctypes.h>

/*  function block LTXdpwm0 (PWM output  1)  */

typedef struct
{
	/* VAR_INPUT */
	UDINT LowTicks;
	UDINT HighTicks;
	/* VAR_OUTPUT */
	const UINT status;
	const UDINT EdgeCnt;
	/* VAR */
	const UINT FUBSTATIC[21];
	/* VAR_INPUT */
	BOOL enable;
}
LTXdpwm0typ;

void LTXdpwm0(LTXdpwm0typ* inst);

/*  function block LTXdpwm1 (PWM output  2)  */

typedef struct
{
	/* VAR_INPUT */
	UDINT LowTicks;
	UDINT HighTicks;
	/* VAR_OUTPUT */
	const UINT status;
	const UDINT EdgeCnt;
	/* VAR */
	const UINT FUBSTATIC[21];
	/* VAR_INPUT */
	BOOL enable;
}
LTXdpwm1typ;

void LTXdpwm1(LTXdpwm1typ* inst);

#ifdef __cplusplus
}
#endif
#endif
