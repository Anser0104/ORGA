global class Creating2RelatedChildRecswithACC implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
   	 
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> acclist) {
     
        list<Contact> listToinsert = new list<Contact>();
            for(Account acc: acclist){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.FirstName = 'testfnam';
                con.LastName = 'testlasnam';
                con.Birthdate = Date.newInstance(2022, 12, 24);
                listToinsert.add(con);
                
                Contact con1 = new Contact();
                con1.AccountId = acc.Id;
                con1.FirstName = 'testfnam1';
                con1.LastName = 'testlasnam1';
                con1.Birthdate = Date.newInstance(2022, 12, 31);
                listToinsert.add(con1);
            }
        
        insert listToinsert;
    }
    global void finish(Database.BatchableContext BC) {
       
    }
}