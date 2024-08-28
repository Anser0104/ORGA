public class updateContactEmailFromAccount implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        string qry = 'SELECT id, email, AccountId, Account.email__c FROM Contact';
        return Database.getQueryLocator(qry);
    }

    public void execute(Database.BatchableContext bc, List<Contact> cList){
        List<Contact> cListToUpdate = new List<Contact>();
        for(Contact cnct: cList){
            if((cnct.Email =='' || cnct.Email ==null) && cnct.AccountId != null && cnct.Account.email__c!=null && cnct.Account.email__c!=''){
                cnct.Email = cnct.Account.email__c;
                cListToUpdate.add(cnct);   
            }
        }
        if(cListToUpdate.size()>0){
            update cListToUpdate;
        }
    }
    public void finish(Database.BatchableContext bc){
        
    }
    
}