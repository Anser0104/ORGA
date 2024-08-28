public class updatingChildObjectTriggerHandler {
    public static void UpdateContactPhone(list<Account> accNewlist){
        list<Id> accIds = new list<Id>();
        list<Contact> conToUpdateList = new list<Contact>();
        for(Account acc:[select Id,Phone,(select Id,Phone from Contacts) FROM Account WHERE Id IN: accNewlist])
        {
            if(acc.Contacts.size()>= 1)
            {
                System.debug('Greater than 1 =====>');
                accIds.add(acc.Id);
            }
            else
            {
              
                for(Contact con:acc.Contacts)
                {
                    con.Phone = acc.Phone;
                    conToUpdateList.add(con);
                }
            }
        }
        if(!conToUpdateList.isEmpty())
        {
            update conToUpdateList;
        }
        if(!accIds.isEmpty())
        {
            UpdateChildContactsOfAccountBatchApex batch = new UpdateChildContactsOfAccountBatchApex(accIds);
            database.executeBatch(batch);
        }
    }
}