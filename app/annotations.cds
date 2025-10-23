using { project1Srv } from '../srv/service.cds';

annotate project1Srv.SalesOrders with @UI.HeaderInfo: { TypeName: 'Sales Order', TypeNamePlural: 'Sales Orders', Title: { Value: orderId } };
annotate project1Srv.SalesOrders with {
  ID @UI.Hidden @Common.Text: { $value: orderId, ![@UI.TextArrangement]: #TextOnly }
};
annotate project1Srv.SalesOrders with @UI.Identification: [{ Value: orderId }];
annotate project1Srv.SalesOrders with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate project1Srv.SalesOrders with {
  products1 @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: products1_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate project1Srv.SalesOrders with @UI.DataPoint #orderDate: {
  Value: orderDate,
  Title: 'Order Date',
};
annotate project1Srv.SalesOrders with {
  orderId @title: 'Order ID';
  orderDate @title: 'Order Date';
  totalAmount @title: 'Total Amount';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate project1Srv.SalesOrders with {
  totalAmount @Measures.ISOCurrency: Currency_code
};

annotate project1Srv.SalesOrders with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: orderId },
 { $Type: 'UI.DataField', Value: orderDate },
 { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: products1_ID }
];

annotate project1Srv.SalesOrders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: orderId },
 { $Type: 'UI.DataField', Value: orderDate },
 { $Type: 'UI.DataField', Value: totalAmount },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: products1_ID }
  ]
};

annotate project1Srv.SalesOrders with {
  customer @Common.Text: { $value: customer.customerId, ![@UI.TextArrangement]: #TextOnly };
  products1 @Common.Text: { $value: products1.productId, ![@UI.TextArrangement]: #TextOnly }
};

annotate project1Srv.SalesOrders with {
  customer @Common.Label: 'Customer';
  products @Common.Label: 'Products';
  products1 @Common.Label: 'Product'
};

annotate project1Srv.SalesOrders with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderDate' }
];

annotate project1Srv.SalesOrders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate project1Srv.SalesOrders with @UI.SelectionFields: [
  customer_ID,
  products1_ID
];

annotate project1Srv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: customerId } };
annotate project1Srv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: customerId, ![@UI.TextArrangement]: #TextOnly }
};
annotate project1Srv.Customers with @UI.Identification: [{ Value: customerId }];
annotate project1Srv.Customers with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate project1Srv.Customers with {
  customerId @title: 'Customer ID';
  name @title: 'Name';
  email @title: 'Email';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate project1Srv.Customers with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: email }
];

annotate project1Srv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: email },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate project1Srv.Customers with {
  salesOrders @Common.Label: 'Sales Orders'
};

annotate project1Srv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate project1Srv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate project1Srv.Customers with @UI.SelectionFields: [
  customerId
];

annotate project1Srv.Products with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productId } };
annotate project1Srv.Products with {
  ID @UI.Hidden @Common.Text: { $value: productId, ![@UI.TextArrangement]: #TextOnly }
};
annotate project1Srv.Products with @UI.Identification: [{ Value: productId }];
annotate project1Srv.Products with {
  salesOrders1 @Common.ValueList: {
    CollectionPath: 'SalesOrders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: salesOrders1_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalAmount'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate project1Srv.Products with @UI.DataPoint #productName: {
  Value: productName,
  Title: 'Product Name',
};
annotate project1Srv.Products with {
  productId @title: 'Product ID';
  productName @title: 'Product Name';
  price @title: 'Price';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate project1Srv.Products with {
  price @Measures.ISOCurrency: Currency_code
};

annotate project1Srv.Products with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: productId },
 { $Type: 'UI.DataField', Value: productName },
 { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Sales Order', Value: salesOrders1_ID }
];

annotate project1Srv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: productId },
 { $Type: 'UI.DataField', Value: productName },
 { $Type: 'UI.DataField', Value: price },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Sales Order', Value: salesOrders1_ID }
  ]
};

annotate project1Srv.Products with {
  salesOrders1 @Common.Text: { $value: salesOrders1.orderId, ![@UI.TextArrangement]: #TextOnly }
};

annotate project1Srv.Products with {
  salesOrders @Common.Label: 'Sales Orders';
  salesOrders1 @Common.Label: 'Sales Order'
};

annotate project1Srv.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#productName' }
];

annotate project1Srv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate project1Srv.Products with @UI.SelectionFields: [
  salesOrders1_ID
];

