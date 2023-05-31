/****************************************************************************
*                                                                           *
*  Name     : io_lib.h	                                                    *
*  Title    : DEFINES for the IO - Library		                            *
*  Date     : 21 June 2000		                                        *
*                                                                           *
******************************COPYRIGHT (C)**********************************
*     THIS SOFTWARE IS THE PROPERTY OF B&R AUSTRIA: ALL RIGHTS RESERVED.    *
*     NO PART OF THIS SOFTWARE MAY BE USED OR COPIED IN ANY WAY WITHOUT     *
*              THE PRIOR WRITTEN PERMISSION OF B&R AUSTRIA.                 *
*****************************************************************************
*                                                                           *
*  Project  : IO - Library				                                    *
*                                                                           *
****************************************************************************/


#ifndef     IO_LIB_H

	#define     IO_LIB_H


/*******************************/
/*        D E F I N E S        */
/*******************************/

/* HW-Typ for HW_list() */
#define     HWLIST_TYPE_IO2010     0
#define     HWLIST_TYPE_IO2005     1
#define     HWLIST_TYPE_RIO2010    2
#define     HWLIST_TYPE_RIO2005    3
#define     HWLIST_TYPE_RIO2003    4
#define     HWLIST_TYPE_IO2003     5
#define     HWLIST_TYPE_CANIO      6
#define     HWLIST_TYPE_CPU        7
#define     HWLIST_TYPE_PP         8
#define     HWLIST_TYPE_SYSTEM     9
#define     HWLIST_TYPE_SYS_SLOT  10

/* Special value for Outputparameter of HW_list */
#define     HW_UNDEFINED          0xFF


/*******************************/
/*        INCLUDES			   */
/*******************************/

#include 	<bur/plctypes.h>			/* Data type definitions to IEC-1131 */


/*******************************/
/*        TYP-Definitions	   */
/*******************************/

/* Definition for the FUB HW_list */
typedef struct HW_list
{
	    /* Non boolean Input  Parameter */
        UDINT   name_adr;

        /* Non boolean Output Parameter */
        UINT    status;
        USINT   hw_type;
        USINT   module_typ;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   slot_no;

        /* Non boolean Static Local */
        USINT   *next_vw_p;
        USINT   *last_modul_p;
        USINT   *next_entry_p;
        USINT   next_entry_ix;
        USINT   next_slot_ix;
        USINT   last_rio_master;

        /* Boolean Input  Parameter */
        BOOL	enable;
        BOOL	first;

} HW_list_typ;

/* Definition for the FUB IO_alloc */ 
typedef struct IO_alloc
{
	    /* Non boolean Input  Parameter */
		UINT	bytesize;

		/* Non boolean Output Parameter */
		UINT	status;
		UDINT	data_ptr;
	
		/* BIT  Input  Parameter */
		BOOL	enable;

} IO_alloc_typ;

/* Definition for the FUB IO_check */
typedef struct IO_check
{
		/* Non booelan Input  Parameter */
        USINT	io_type;
        USINT	master_no;
        USINT	slave_no;
        USINT   module_adr;
        USINT   search_typ;
        
		/* Non boolean Output Parameter */
        UINT    status;
        USINT   module_typ;
        
		/* Non boolean Static Local     */
        UDINT   chk_ident;
        USINT   sc_mod_adr;
        USINT   sc_kurzken;
        USINT   sc_int_off;
        USINT   sc_laenge;
        UINT    sc_ioc_ptr;
        UINT    sc_ende;
        UDINT   sc_data;
        UDINT   sc_data2;
        UDINT   sc_data3;
        
        /* Boolean Input  Parameter */
        BOOL	enable;
        
		/* Boolean Output Parameter */
        BOOL	found_flag;

} IO_check_typ;

/* Definition for the FUB IO_data */
typedef struct IO_data
{
		/* Non boolean Input  Parameter */
        UDINT   ioident;
        
		/* Non booelan Output Parameter */
        UINT    status;
        
        /* Boolean Input  Parameter */
        BOOL	enable;

} IO_data_typ;

/* Definition for the FUB IO_disable */
typedef struct IO_disable
{
        /* Non boolean Input  Parameter */
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   force_flag;
        UINT    ana_value;

        /* Non boolean Output Parameter */
        UINT    status;

		/* Boolean Input  Parameter */
        BOOL	enable;
 		BOOL	dig_value;

} IO_disable_typ;

/* Definition for the FUB IO_enable */
typedef struct IO_enable
{
        /* Non boolean Input  Parameter */
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;

        /* Non booelan Output Parameter */
        UINT    status;

        /* Boolean Input Parameter */
        BOOL	enable;

} IO_enable_typ;


/* Definition for the FUB IO_free */
typedef struct IO_free
{
	    /* Non booelan Input Parameter */
		UINT    bytesize;
		UDINT   data_ptr;
 
		/* Non boolean Output Parameter */
		UINT    status;

        /* Boolean Input Parameter */
		BOOL	enable;

} IO_free_typ;


/* Definition for the FUB IO_info */
typedef struct IO_info
{
	    /* Non boolean Output Parameter */
        UINT    status;
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   intern_off;
        USINT   mode;
       
        /* Boolean Input  Parameter */
        BOOL	enable;

} IO_info_typ;

/* Definition for the FUB IO_list */
typedef struct IO_list
{
	/* Non booelan Input  Parameter */
        USINT	io_type;
        USINT	master_no;
        USINT	slave_no;
        USINT	prev_mod;
        SINT	*name_adr;

        /* Non boolean Output Parameter */
        UINT	status;
        USINT	module_adr;
        USINT	module_typ;
        UINT	io_bus;

        /* Non boolean Static Local     */
        UDINT	initcnt;
        USINT	first_flag;
        USINT	chk_io_type;
        USINT	chk_master_no;
        USINT	chk_slave_no;
        USINT	chk_module_adr;
        USINT	entry;     
        USINT	*entry_ptr;
        USINT	*tab_ptr;
        USINT	reserve_b[16];

        /* Boolean Input  Parameter */
        BOOL	enable;

        /* Boolean Static Local     */
        BOOL	chk_found;

} IO_list_typ;

    
/* Definition of the IOP-Struct with the log. shovelinformation */
typedef struct 
{
        USINT   io_type;             /* 2010 / 2005	                     */
        USINT   master_no;
        USINT   slave_no;            /* 2005: 0=BasisIO, n=Extension	 */
        USINT   module_adr;          /* analog to PG-Definition          */
        USINT   intern_off;          /* Transparent-Input in PG          */
        USINT   mode;                /* Read/Write Status/Normal         */
        USINT   data_len;            /* Length in Bytes                  */
        USINT   reserve;
        UDINT   data_adr;            /* Address for shovel on CPU     */

} IOP_typ;


/* Definition for the FUB IO_mphydef */
typedef struct IO_mphydef
{
	    /* Non boolean Input  Parameter */
        IOP_typ *iop_adr;
        USINT   *sc_adr;
        UINT    io_index;
     
		/* Non boolean Output Parameter */
        UINT	status;
        UDINT   ioident;

        /* Boolean Input  Parameter */
        BOOL	enable;

} IO_mphydef_typ;


/* Definition for the FUB IO_ptest */
typedef struct IO_ptest
{
		/* Non boolean Input  Parameter */
        IOP_typ *iop_adr;
        
		/* Non boolean Output Parameter */
        UINT    status;
        
		/* Non boolean Static Local     */
        USINT   chk_io_typ;
        USINT   chk_master;
        USINT   chk_slave;
        USINT   chk_module;
        USINT   chk_search;
        UINT    chk_status;
        USINT   chk_modtyp;
        UDINT   chk_ident;
        USINT   sc_mod_adr;
        USINT   sc_kurzken;
        USINT   sc_int_off;
        USINT   sc_laenge;
        UINT    sc_ioc_ptr;
        UINT    sc_ende;
        
        /* Boolean Input  Parameter */
        BOOL	enable;
        
		/* Boolean Output Parameter */
        BOOL	ok;

} IO_ptest_typ;

/* Definition for the FUB IO_slist */
typedef struct IO_slist
{
		/* Non boolean Input  Parameter */
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   prev_slot;
		SINT    *name_adr;
      
		/* Non boolean Output Parameter */
        UINT    status;
        USINT   slot_no;
        USINT   slot_typ;
      
		/* Non boolean Static Local     */
        UDINT   initcnt;
        USINT   first_flag;
        USINT   chk_io_type;
        USINT   chk_master_no;
        USINT   chk_slave_no;
        USINT   chk_module_adr;
        USINT   entry;
        USINT   *entry_ptr;
		USINT   *tab_ptr;
		USINT   slot_cnt;

        /* Boolean Input  Parameter */
        BOOL	enable;
        
		/* Boolean Static Local     */
        BOOL	chk_found;

} IO_slist_typ;

/* Definition for the FUB IX_check */
typedef struct IX_check
{
	    /* Non boolean Input  Parameter */
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   slot;
        USINT   search_typ;
     
		/* Non boolean Output Parameter */
        UINT    status;
        USINT   module_typ;
        
		/* Non boolean Static Local     */
        USINT   chk_align;
        USINT   chk_io_typ;
        USINT   chk_master;
        USINT   chk_slave;
        USINT   chk_module;
        USINT   chk_search;
        UINT    chk_status;
        USINT   chk_modtyp;
        UDINT   chk_ident;
        USINT   sc_mod_adr;
        USINT   sc_kurzken;
        USINT   sc_int_off;
        USINT   sc_laenge;
        UINT    sc_ioc_ptr;
        UINT    sc_ende;
        UDINT   sc_data;
        UDINT   sc_data2;
        UDINT   sc_data3;

        /* Boolean Input  Parameter */
        BOOL	enable;
        
		/* Boolean Output Parameter */
        BOOL	found_flag;

} IX_check_typ;

/* Definition for the FUB IX_disable */
typedef struct IX_disable
{
		/* Non boolean Input  Parameter */
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   slot;
        USINT   force_flag;
        UINT    ana_value;
        
		/* Non boolean Output Parameter */
        UINT    status;
        
        /* Boolean Input  Parameter */
        BOOL	enable;
        BOOL	dig_value;

} IX_disable_typ;

/* Definition for the FUB IX_enable */
typedef struct IX_enable
{
		/* Non boolean Input  Parameter */
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   slot;
        /* Non boolean Output Parameter */
        UINT    status;
        
        /* Boolean Input  Parameter */
        BOOL	enable;

} IX_enable_typ;

/* Definition for the FUB IX_info */
typedef struct IX_info
{
		/* Non boolean Output Parameter */
        UINT    status;
        USINT   io_type;
        USINT   master_no;
        USINT   slave_no;
        USINT   module_adr;
        USINT   slot;
        USINT   intern_off;
        USINT   mode;
        
        /* Boolean Input  Parameter */
        BOOL	enable;

} IX_info_typ;

/* Definition for the FUB SYS_list */
typedef struct SYS_list
{
	    /* Non boolean Input  Parameter */
        USINT   prev_mod;
        SINT    *name_adr;
      
		/* Non boolean Output Parameter */
        UINT    status;
        USINT   module_adr;
        USINT   module_typ;
        
        /* Boolean Input  Parameter */
        BOOL	enable;

} SYS_list_typ;


/*******************************/
/*   P R O T O T Y P I N G     */
/*******************************/

void HW_list		(HW_list_typ*		HW_list_ptr		);
void IO_alloc		(IO_alloc_typ*		IO_alloc_ptr	);
void IO_check		(IO_check_typ*		IO_check_ptr	);
void IO_data		(IO_data_typ*		IO_data_ptr		);
void IO_disable		(IO_disable_typ*	IO_disable_ptr	);
void IO_enable		(IO_enable_typ*		IO_enable_ptr	);
void IO_free		(IO_free_typ*		IO_free_ptr		);
void IO_info		(IO_info_typ*		IO_info_ptr		);
void IO_list		(IO_list_typ*		IO_list_ptr		);
void IO_mphydef		(IO_mphydef_typ*	IO_mphydef_ptr	);
void IO_ptest		(IO_ptest_typ*		IO_ptest_ptr	);
void IO_slist		(IO_slist_typ*		IO_slist_ptr	);
void IX_check		(IX_check_typ*		IO_check_ptr	);
void IX_disable		(IX_disable_typ*	IX_disable_ptr	);
void IX_enable		(IX_enable_typ*		IX_enable_ptr	);
void IX_info		(IX_info_typ*		IX_info_ptr		);
void SYS_list		(SYS_list_typ*		SYS_list_ptr	);

#endif /* IO_LIB_H */
