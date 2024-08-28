trigger acctriggerForBatch on Account (before update) {
    list<Account> acctAddTolist = new list<Account>();
    for(Account acc:trigger.new){
        if(acc.Rating !=Null){
            acctAddTolist.add(acc);
            system.debug('Accounts :'+acctAddTolist);
        }
    }
    
    if(acctAddTolist.size()>0){
        Database.executeBatch(new ProintAccountsBatchApex(acctAddTolist));
    }
}