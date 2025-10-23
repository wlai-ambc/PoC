namespace project1;
using { cuid, managed, Currency } from '@sap/cds/common';

@assert.unique: { orderId: [orderId] }
entity SalesOrders : cuid, managed {
  orderId: String(50) @mandatory;
  orderDate: Date;
  totalAmount: Decimal(10,2);
  Currency: Currency;
  customer: Association to Customers;
  products: Association to many Products on products.salesOrders1 = $self;
  products1: Association to Products;
}

@assert.unique: { customerId: [customerId] }
entity Customers : cuid, managed {
  customerId: String(50) @mandatory;
  name: String(100);
  email: String(100);
  salesOrders: Association to many SalesOrders on salesOrders.customer = $self;
}

@assert.unique: { productId: [productId] }
entity Products : cuid, managed {
  productId: String(50) @mandatory;
  productName: String(100);
  price: Decimal(10,2);
  Currency: Currency;
  salesOrders: Association to many SalesOrders on salesOrders.products1 = $self;
  salesOrders1: Association to SalesOrders;
}

