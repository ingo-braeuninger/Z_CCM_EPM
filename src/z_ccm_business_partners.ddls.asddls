@AbapCatalog.sqlViewName: 'ZVCCMBUPAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Custom Code Migration'
define view z_ccm_business_partners
   as select from snwd_bpa
{
       //snwd_bpa
   key client,
   key node_key,
       bp_role,
       email_address,
       phone_number,
       fax_number,
       web_address,
       address_guid,
       bp_id,
       company_name,
       legal_form,
       created_by,
       created_at,
       changed_by,
       changed_at,
       currency_code
}
