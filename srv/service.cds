using { myFioriApp } from '../db/schema.cds';

service myFioriAppSrv {
  @odata.draft.enabled
  entity Users as projection on myFioriApp.Users;
}