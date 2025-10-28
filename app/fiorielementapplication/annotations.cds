using { myFioriAppSrv } from '../../srv/service.cds';

annotate myFioriAppSrv.Users with @UI.DataPoint #userName: {
  Value: userName,
  Title: 'User Name',
};
annotate myFioriAppSrv.Users with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#userName', ID: 'UserName' }
];
annotate myFioriAppSrv.Users with @UI.HeaderInfo: {
  TypeName: 'User',
  TypeNamePlural: 'Users',
  Title: { Value: userId }
};
annotate myFioriAppSrv.Users with {
  ID @UI.Hidden
};
annotate myFioriAppSrv.Users with @UI.Identification: [{ Value: userId }];
annotate myFioriAppSrv.Users with {
  userId @Common.Label: 'User Id';
  userName @Common.Label: 'User Name';
  email @Common.Label: 'Email';
  isActive @Common.Label: 'Is Active';
  createdDate @Common.Label: 'Created Date'
};
annotate myFioriAppSrv.Users with {
  ID @Common.Text: { $value: userId, ![@UI.TextArrangement]: #TextOnly };
  isActive @Common.Text : { $value: isActive.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate myFioriAppSrv.Users with {
  isActive @Common.ValueListWithFixedValues;
};
annotate myFioriAppSrv.Users with @UI.SelectionFields: [
  userId,
  isActive_code
];
annotate myFioriAppSrv.Users with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: userId },
    { $Type: 'UI.DataField', Value: userName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: isActive_code, Criticality: isActive.criticality },
    { $Type: 'UI.DataField', Value: createdDate }
];
annotate myFioriAppSrv.Users with @UI.FieldGroup #userDetailsSection: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: userId },
    { $Type: 'UI.DataField', Value: userName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: isActive_code, Criticality: isActive.criticality },
    { $Type: 'UI.DataField', Value: createdDate }

  ]
};


annotate myFioriAppSrv.Users with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'userDetailsTab',
    Label: 'User Details',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'userDetailsSection', Label: 'User Details', Target: '@UI.FieldGroup#userDetailsSection' } ]
  }
];