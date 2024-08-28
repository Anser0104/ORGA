public class updateContactEmail implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        string qry='SELECT id, Email FROM Contact';
        return Database.getQueryLocator(qry);
    }
    public void execute(Database.BatchableContext bc, List<Contact> cList){
        List<Contact> cListToUpdate = new List<Contact>();
        for(Contact cnct: cList){
            if(cnct.Email==null || cnct.Email==''){
                cnct.Email = 'test@123.com';
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