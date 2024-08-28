trigger AccountCannotDeleteWhenithasChildRecords on Account (before Delete) {
    List<Account> acclist = [select id, (select id from Contacts) from Account where id in : trigger.old];
    for(Account ac: trigger.old){
        for(Account acc: acclist){
            if(acc.Contacts.size()>=1){
                ac.addError('Account cannot be delete as it has releated contacts.');
            }
        }
    }
}