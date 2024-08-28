trigger UpsertContacts on Account (after insert, after update) {
     
    set<Id> accids = new set<Id>();
    if(trigger.isinsert)
    {
        for(Account ac: trigger.new){
            accids.add(ac.Id);
        }
    }
    
     if(trigger.isupdate)
    {
        for(Account ac: trigger.new){
            accids.add(ac.Id);
        }
    }
    
    List<Account> acclist = [SELECT Id, Name,Count_Of_Contacts__c,BillingPostalCode,(select id, name, AccountId from Contacts) from Account where Id IN :accids];
    
    Map<Id, integer> newaccmap = new Map<Id, integer>();
    List<Contact> conlstupdate = new List<Contact>();
    for(Account acc : acclist){
        newaccmap.put(acc.Id, acc.contacts.size());
        if(acc.Contacts.size()>0 && acc.BillingPostalCode != trigger.oldmap.get(acc.id).BillingPostalCode){
            acc.Count_Of_Contacts__c = newaccmap.get(acc.Id);
        }
        else if(acc.Contacts.size()==0){
            Contact con = new Contact();
            con.FirstName ='demoF';
            con.LastName ='demoL';
            con.AccountId = acc.Id;
            conlstupdate.add(con);
            
        }
    }
    if(conlstupdate.size()>0){
        upsert conlstupdate;
    }  
}