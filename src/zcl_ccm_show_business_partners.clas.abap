CLASS zcl_ccm_show_business_partners DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    INTERFACES zif_ccm_show_business_partners.

  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES:
      BEGIN OF ty_bp_id,
        bp_id TYPE snwd_bpa-bp_id,
      END OF ty_bp_id .
    TYPES:
      tt_bp_id TYPE STANDARD TABLE OF ty_bp_id .

    METHODS method1
      IMPORTING VALUE(iv_client) TYPE mandt
                VALUE(iv_bp_id)  TYPE snwd_partner_id
      EXPORTING VALUE(et_data)   TYPE tt_bp_id.

    METHODS method2
      IMPORTING VALUE(iv_client) TYPE mandt
                VALUE(iv_bp_id)  TYPE snwd_partner_id.

ENDCLASS.



CLASS zcl_ccm_show_business_partners IMPLEMENTATION.

  METHOD method1 BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT USING snwd_bpa.

    et_data =
         select bp_id from snwd_bpa
          where bp_id = :iv_bp_id
             and client = :iv_client;


  ENDMETHOD.


  METHOD method2 BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    USING snwd_bpa zcl_ccm_show_business_partners=>method1.

    -- Select a scalar value:
            declare lv_role NVARCHAR(3);
            select bp_role into lv_role from snwd_bpa
                where bp_id = :iv_bp_id and client = :iv_client;

        -- Select into internal table:
            it_bp_id = select bp_id from snwd_bpa where bp_role = :lv_role;

        -- Select into result set from multiple values / internal tables:
           et_result = select bp_id, company_name from snwd_bpa
            where client = :iv_client and bp_id in (select bp_id from :it_bp_id);

        -- Call another AMDP method:
        CALL "ZCL_CCM_SHOW_BUSINESS_PARTNERS=>METHOD1"(:iv_client, :iv_bp_id, :et_data );

  ENDMETHOD.

  METHOD zif_ccm_show_business_partners~calculate.

    GET RUN TIME FIELD DATA(t1).
    GET RUN TIME FIELD DATA(t2).
    DATA(t) = ( t2 - t1 ) / 1000.
    GET TIME STAMP FIELD DATA(lv_tmstmp).

    DATA: l_timestamp TYPE timestamp,
          l_date      TYPE d,
          l_time      TYPE t.
    GET TIME STAMP FIELD l_timestamp.
    CONVERT TIME STAMP l_timestamp TIME ZONE sy-zonlo INTO DATE l_date TIME l_time.


  ENDMETHOD.
ENDCLASS.
