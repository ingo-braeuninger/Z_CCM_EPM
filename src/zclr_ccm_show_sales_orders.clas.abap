CLASS zclr_ccm_show_sales_orders DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclr_ccm_show_sales_orders IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT FROM z_ccm_sales_orders
      FIELDS *
      INTO TABLE @DATA(lt_data)
      UP TO 100 ROWS.

    out->write( lt_data ).

  ENDMETHOD.

ENDCLASS.
