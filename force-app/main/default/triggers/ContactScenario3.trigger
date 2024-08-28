trigger ContactScenario3 on Contact (after insert) {
    list<Account> accupdate = new list<Account>();
    for(Contact con: trigger.new)
    {
        if((con.LastName==con.LastName && con.Email==con.Email) && (con.AccountId!=null))
        {
            Account acc = new Account();
            acc.Id = con.AccountId;
            acc.Email__c=con.Email;
            accupdate.add(acc);
        }
    }
    update accupdate;
}