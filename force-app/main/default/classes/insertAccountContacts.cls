public class insertAccountContacts implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        string qry='SELECT id, name, (SELECT id, name FROM Contacts) FROM Account';
        return Database.getQueryLocator(qry);
    }
    public void execute(Database.BatchableContext bc, List<Account> accList){
        List<Contact> cnctList = new List<Contact>();
        for(Account acc: accList){
            if(acc.Contacts.size()==0){
                //insert two contacts
                Contact cnct1 = new Contact();
                cnct1.LastName = acc.Name;
                cnct1.AccountId = acc.Id;
                cnctList.add(cnct1);
                
                Contact cnct2 = new Contact();
                cnct2.LastName = acc.Name;
                cnct2.AccountId = acc.Id;
                cnctList.add(cnct2);
            }
            else if(acc.Contacts.size()==1){
                //insert one contact
                Contact cnct = new Contact();
                cnct.LastName = acc.Name;
                cnct.AccountId = acc.Id;
                cnctList.add(cnct);
            }
        }
       // if(cnctList.size()>0){
            insert cnctList;
        
        
    }
    public void finish(Database.BatchableContext bc){
        Database.executeBatch(new updateContactEmail());
    }
}