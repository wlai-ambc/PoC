using { project1 as my } from '../db/schema.cds';

@path: '/service/project1'
@requires: 'authenticated-user'
service project1Srv {
  @odata.draft.enabled
  entity SalesOrders as projection on my.SalesOrders;
  @odata.draft.enabled
  entity Customers as projection on my.Customers;
  @odata.draft.enabled
  entity Products as projection on my.Products;
}