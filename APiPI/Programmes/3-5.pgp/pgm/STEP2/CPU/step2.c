/*'**********************************************************************************
'*																					*
'* Demo - Step 2 - PP41																*
'*	last change: 06.04.2001:	Christopher Karger									*
'* 																					*
'*																					*
'*																					*
'*																					*
'***********************************************************************************/

#include <bur/plc.h>
#include <bur/plctypes.h>

_GLOBAL UINT		DynamicBitmap1;
_GLOBAL UINT		DynamicBitmap2;

_GLOBAL unsigned char 	U8array[10];
_GLOBAL signed long 	S32array[10];
_GLOBAL signed short 	S16array[10];

_GLOBAL USINT 		textlayer;
_GLOBAL USINT 		LedMatrixArray[100];
_GLOBAL USINT		LEDFunction, TestLED;
_GLOBAL USINT 		counter;

_LOCAL USINT	ListBox_SelectedItem;
_LOCAL USINT	ListBox_Status;
_LOCAL STRING	ListBox_Stringarray[10][30];

_LOCAL UINT 		Farbe, Status;
_LOCAL USINT		Schalter;
_LOCAL UINT			LEDFarbe[20];
_LOCAL USINT 		LEDStatus[20];

_GLOBAL UINT 		picchange;
_GLOBAL UINT 		picnumber;

int id;
_INIT void init_counter(void)

{
	U8array[0]=0;
	S32array[0]=0;
	S16array[0]=0;
	counter=0;
	LEDFunction=0;
	TestLED=0;
	for (id=0;id<20;id++)
	 {
	 LEDFarbe[id]=256;	
	 }
for (id=0;id<20;id++)
	 {
	 LEDStatus[id]=0;	
	 }

}

_CYCLIC void main_cycle(void)
{
	
	counter++;
	
	/* shows dynamic bitmaps */
	if (counter==10) 
		{
	
		if (DynamicBitmap1 >= 3) 
			{
			 DynamicBitmap1 = 0;
			}
		else 
		       {
			DynamicBitmap1++;
		       }
		
		if (DynamicBitmap2 >= 3) 
		   	{
			 DynamicBitmap2 = 0;
		   	}
		else 
			{
			 DynamicBitmap2++;
			}
	
	counter=0;

	}

	/* enable all LEDs on the PP41 */
	if (TestLED==1)
          {
	           for (id=0;id<=40;id++)
	               	{
			 LedMatrixArray[id]=LEDFunction;
			}
		  }
		 else	/* disable all LED's */
	             { 	    
		      for (id=0;id<=40;id++)
	             		{
				 LedMatrixArray[id]=0;
				}
 		     }
	 
/* Funktionen ein/ausschalten */
if (Schalter==1 && (LEDStatus[ListBox_SelectedItem]==0) )
	{
	 LEDFarbe[ListBox_SelectedItem]=257; /*schwarzes Rechteck */
	 LEDStatus[ListBox_SelectedItem]=1;
	Schalter=0;
	}
else if (Schalter==1 && (LEDStatus[ListBox_SelectedItem]==1) )

	{
	 LEDFarbe[ListBox_SelectedItem]=256; /* weisses Rechteck */
	 LEDStatus[ListBox_SelectedItem]=0;
	 Schalter=0;
	}




}	/* End of main_cycle */
