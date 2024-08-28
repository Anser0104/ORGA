Trigger createchildcontacts on Contact(before insert, before update)
{
    set<id> accidset = new set<id>();

    for(Contact con:trigger.new)
        {
        if((con.status__c!=null || con.status__c!='') &&  con.status__c=='Progress' && con.Accountid!=null)
          {
          accidset.add(con.Accountid);
          }
        }

        list<Contact> conlst = new list<Contact>(); 
          list<Account> acclst=[SELECT Id,Name,(select id,LastName, status__c from Contacts)FROM Account WHERE Id IN:accidset];
          for(Account acc:acclst)
          {
              Contact cnct = new Contact();
                    cnct.LastName=acc.Name;
                    cnct.Accountid=acc.id;
                    conlst.add(cnct);
          }
        
    insert conlst;
}