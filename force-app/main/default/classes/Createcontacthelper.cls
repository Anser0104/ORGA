public class Createcontacthelper {
    public static void Createcontactmethod(Map<Id,Account>accnewmap, Map<Id,Account>accoldmap)
    {
        set<Id>accids= new set<Id>();
        List<Contact> conlstToUpdate = new List<Contact>();
        for(Account acc:accnewmap.values())
        {
            if(accnewmap.get(acc.Id).Create_Contacts__c && !accoldmap.get(acc.Id).Create_Contacts__c)
            {
                Contact con = new Contact();
                con.AccountId= acc.Id;
                con.LastName= acc.Name;
                conlstToUpdate.add(con);
            }
        }
        insert conlstToUpdate;
    }
}