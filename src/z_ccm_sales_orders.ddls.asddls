@AbapCatalog.sqlViewName: 'ZVCCMSLSORDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Custom Code Migration'
define view z_ccm_sales_orders
   as select from snwd_so
{
       //snwd_so
   key client,
   key node_key,
       so_id,
       created_by,
       created_at,
       changed_by,
       changed_at,
       created_by_bp,
       changed_by_bp,
       note_guid,
       buyer_guid,
       currency_code,
       gross_amount,
       net_amount,
       tax_amount,
       lifecycle_status,
       billing_status,
       delivery_status,
       op_id,
       _dataaging,
       dummy,
       overall_status,
       buy_contact_guid,
       ship_to_adr_guid,
       bill_to_adr_guid,
       payment_method,
       payment_terms
}
