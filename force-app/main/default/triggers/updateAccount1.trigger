trigger updateAccount1 on Account (before update) {
set<Id> accIdSet = new set<Id>();
    for(Account acc: Trigger.new){
        if(acc.Count_checkbox__c==true && acc.Count_checkbox__c!= trigger.oldmap.get(acc.id).Count_checkbox__c){
            accIdSet.add(acc.id);
        }
    }
    map<id, integer> accIdContactsCount = new map<id, integer>();
    if(accIdSet.size()>0){
        for(Account acc: [SELECT id, (SELECT id from contacts) from account where id IN: accIdSet]){
            if(acc.contacts.size()>0){
                accIdContactsCount.put(acc.id, acc.contacts.size());
            }
        }
    }
    for(Account acc: Trigger.new){
        if(acc.Count_checkbox__c==true && accIdContactsCount.containsKey(acc.id)){
            acc.Count_Of_Contacts__c = accIdContactsCount.get(acc.id);
        }
    }
}