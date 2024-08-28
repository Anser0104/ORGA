trigger updateContactsfield on Account (after update)
{
    list<Contact> conlist= new list<Contact>();
    
        for(Account acc:trigger.new)
        {
            if(acc.No_of_Contacts__c!= null && acc.No_of_Contacts__c!=0)
            {
                if(trigger.oldMap.get(acc.Id).No_of_Contacts__c!= acc.No_of_Contacts__c)
                {
                    for(integer i=0; i<acc.No_of_Contacts__c; i++)
                    {
                        contact con = new contact();
                        con.LastName= acc.Name+i;
                        con.Phone= acc.Phone;
                        con.Email= acc.Email__c;
                        con.AccountId=acc.Id;
                        conlist.add(con);
                        
                    }
                }
                
            }
            
        }
    
    
    insert conlist;
}