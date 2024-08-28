//8.When ever a new Account is created with Industry as Energy  then create a contact
trigger AccountScenario3 on Account (after insert) {
    list<Contact> conlist = new list<Contact>();
    for(Account acc: trigger.new){
        if((acc.Name == acc.Name &&  acc.Industry =='Energy') && (acc.ParentId!=NULL || acc.ParentId!=''))
        {
            Contact con = new Contact();
            con.LastName = 'trigger contact 7';
            con.AccountId = acc.ParentId; 
            conlist.add(con);
        }

    }
    insert conlist;
}