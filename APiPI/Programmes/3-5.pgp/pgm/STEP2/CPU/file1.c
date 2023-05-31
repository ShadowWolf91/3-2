#include <bur/plc.h>       /* macros for B&R PLC programming */
#include <bur/plctypes.h>  /* Data type definitions corresponding to IEC-1131 */
#include <asmath.h>        /* prototypes for AsMath-Libary */
/* Variable declaration */
_LOCAL REAL z,x;
/* init part of task */
void _INIT fixw ( void )
{
  /* set variable */
  x=3;
}
/* cyclic part of task */
void _CYCLIC cosex ( void )
{
  /* call function */
  z = cosh( x );
}
