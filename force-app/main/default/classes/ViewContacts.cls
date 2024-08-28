@RestResource(urlMapping='/Contacts/*')
global class ViewContacts
{
@HTTPGet
 global static list<Contact> getContactrecords()
 {
     list<Contact> lst;
     lst=[select Name,Email,LeadSource,CleanStatus,AccountId from Contact limit 5];
     return lst;
 }
}