*&---------------------------------------------------------------------*
*& Report z_ccm_display_slsords
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ccm_display_slsords.

DATA: lo_exc TYPE REF TO cx_salv_function_not_supported.

TRY.
    cl_salv_gui_table_ida=>create_for_cds_view( 'z_ccm_sales_orders' )->fullscreen( )->display( ).
  CATCH cx_salv_function_not_supported INTO lo_exc.
    MESSAGE lo_exc TYPE 'I'.
ENDTRY.
