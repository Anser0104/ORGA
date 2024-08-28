public class updateContactEMAIL_batchapex implements database.Batchable<sObject> {
    public Database.QueryLocator start(database.BatchableContext bc){
        string qry ='SELECT id,Email,AccountId,Account.Email__c FROM Contact';
 	       return database.getQueryLocator(qry);
    }
    public void execute(database.BatchableContext bc, list <Contact> cnlist){
        List<Contact> cnlistToUpdate = new list<Contact>();
        for(Contact cnct: cnlist)
        {
            if((cnct.Email == '' || cnct.Email == null) && cnct.AccountId != null && 
               cnct.Account.Email__c != null && cnct.Account.Email__c != '')
            {
                cnct.Email = cnct.Account.Email__c;
                cnlistToUpdate.add(cnct);
            }
        }
        if(cnlistToUpdate.size()>0)
        {update cnlistToUpdate;}
    }
    public void finish(database.BatchableContext bc)
   	 {  }
}