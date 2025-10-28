using { sap.common.CodeList } from '@sap/cds/common';

namespace myFioriApp;

entity UsersIsActiveCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
  criticality : Integer;
}

entity Users {
  key ID: UUID;
  userId: String(50) @assert.unique @mandatory;
  userName: String(100);
  email: String(100);
  isActive: Association to UsersIsActiveCodeList;
  createdDate: DateTime;
}
