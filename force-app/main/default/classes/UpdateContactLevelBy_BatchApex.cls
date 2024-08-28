public class UpdateContactLevelBy_BatchApex implements database.Batchable<sObject> {
    
    public Database.QueryLocator start(database.BatchableContext bc){
        string qry ='SELECT id,Level__c FROM Contact';
        return database.getQueryLocator(qry);
    }
    public void execute(database.BatchableContext bc, list<Contact> cnlist){
        List<Contact> cnlistToUpdate = new list<Contact>();
        for(Contact cnct: cnlist)
        {
            if(cnct.Level__c==null || cnct.Level__c=='')
            {
                cnct.Level__c ='Primary';
                cnlistToUpdate.add(cnct);
            }
        }
        if(cnlistToUpdate.size()>0)
        {update cnlistToUpdate;}
    }
    public void finish(database.BatchableContext bc){
        
    }
}