/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef VISAPI_H_
#define VISAPI_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>



/* Constants */


/* Datatypes */
typedef struct TouchAction
{
	unsigned long status;
	unsigned long y;
	unsigned long x;
} TouchAction;

typedef struct VCHANDLE
{
} VCHANDLE;

typedef struct display_info
{
	unsigned short width;
	unsigned short height;
	unsigned long func1;
	unsigned long func2;
	unsigned char bpp;
} display_info;



/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
unsigned short VA_GetTextByTextGroup(plcbit enable, unsigned long VCHandle, unsigned short TG_id, unsigned short TGT_id, unsigned long pcText, unsigned long psTextlength);
unsigned short VA_GetDisplayInfo(plcbit enable, unsigned long VCHandle, unsigned long InfoType, unsigned long Value);
unsigned short VA_DrawBitmap(plcbit enable, unsigned long VCHandle, unsigned short index, unsigned short x, unsigned short y);
unsigned short VA_SetupX(plcbit enable, VCHANDLE* VCHandle, plcstring* interpreter);
unsigned short VA_Shutdown(plcbit enable, unsigned long VCHandle);
unsigned short VA_Line(plcbit enable, unsigned long VCHandle, unsigned short x1, unsigned short y1, unsigned short x2, unsigned short y2, unsigned short color);
unsigned short VA_Ellipse(plcbit enable, unsigned long VCHandle, unsigned short x, unsigned short y, unsigned short heigth, unsigned short width, unsigned short fill, unsigned short color);
unsigned short VA_GetPanelStatus(plcbit enable, unsigned long VCHandle, unsigned long puiPanelStatus);
unsigned short VA_Quit(plcbit enable, unsigned long VCHandle, unsigned char cGroupNumber, unsigned char cAlarmNumber);
unsigned short VA_SetBacklight(plcbit Enable, unsigned long VCHandle, plcbit blnState);
unsigned short VA_DelAlarmHistory(plcbit enable, unsigned long VCHandle);
unsigned short VA_SaveSettings(plcbit enable, unsigned long VCHandle, unsigned short uiAction);
unsigned short VA_GetActAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction, unsigned char cSeperator, unsigned char cDateTimeFormat);
unsigned short VA_CopyScreenRect(plcbit enable, unsigned long VCHANDLE, unsigned short x1, unsigned short y1, unsigned short x2, unsigned short y2, signed short dx, signed short dy);
unsigned short VA_ExchangeFont(plcbit enable, unsigned long VCHandle, unsigned char cIndex, unsigned char cNewIndex);
unsigned short VA_GetContrast(plcbit enable, unsigned long VCHandle);
unsigned short VA_GetAlCurPos(plcbit enable, unsigned long VCHandle, signed long pGroupNumber, signed long pAlarmNumber);
unsigned short VA_SetPaletteColor(plcbit enable, unsigned long VCHandle, unsigned char index, unsigned long color);
unsigned long VA_GetPaletteColor(plcbit enable, unsigned long VCHandle, unsigned char index);
unsigned short VA_StopProject(plcbit enable, unsigned long VCHandle);
unsigned short VA_StartProject(plcbit enable, unsigned long VCHandle);
unsigned short VA_GetCalStatus(plcbit enable, unsigned long VCHandle);
unsigned short VA_StartTouchCal(plcbit enable, unsigned long VCHandle);
unsigned long VA_Setup(plcbit enable, plcstring* interpreter);
unsigned short VA_Redraw(plcbit enable, unsigned long VCHandle);
unsigned short VA_GetTouchAction(plcbit enable, unsigned long VCHandle, unsigned long type, unsigned long status);
unsigned short VA_SetBrightness(plcbit enable, unsigned long VCHandle, unsigned long percent);
unsigned short VA_SetContrast(plcbit enable, unsigned long VCHandle, unsigned long percent);
unsigned short VA_Invblnk(plcbit enable, unsigned long VCHandle, unsigned short mode);
unsigned short VA_GetAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction);
unsigned short VA_Textout(plcbit enable, unsigned long VCHandle, unsigned short font_index, unsigned short x, unsigned short y, unsigned char fC, unsigned char bC, plcstring* str);
unsigned short VA_Srelease(plcbit enable, unsigned long VCHandle);
unsigned short VA_Saccess(plcbit enable, unsigned long VCHandle);
unsigned short VA_GetExAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction, unsigned char cSeperator, unsigned char cDateTimeFormat);
unsigned short VA_QuitAlarms(plcbit enable, unsigned long VCHandle, unsigned short wGroupNumber);
unsigned short VA_SetUserParam(plcbit enable, unsigned long VCHandle, unsigned char Type, unsigned long Parameter);
unsigned short VA_Rect(plcbit enable, unsigned long VCHandle, unsigned short x1, unsigned short y1, unsigned short width, unsigned short height, unsigned short fill, unsigned short color);
unsigned short VA_GetKeyMatrix(plcbit enable, unsigned long VCHandle, unsigned long KeyMatrix, unsigned long KeysToRead, unsigned long KeysRead);



#endif /* VISAPI_H_ */