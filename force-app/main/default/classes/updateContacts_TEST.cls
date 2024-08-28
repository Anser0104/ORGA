@istest
public class updateContacts_TEST {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.name = 'test acc';
        acc.Industry='Energy';
        insert acc;
        
         Account acc1 = new Account();
        acc1.name = 'test acc2';
        acc1.Industry='Energy';
        insert acc1;
        
        Contact con = new Contact();
        con.LastName ='tesst contact';
        con.AccountId = acc.Id;
        insert con;
        
        Contact con1 = new Contact();
        con1.LastName ='tesst contact1';
        con1.AccountId = acc.Id;
        con1.Id=con.id;
        update con1;
        
        Contact con2 = new Contact();
        con2.LastName ='tesst contact1';
        con2.AccountId = acc.Id;
		con2.Id=con.id;
        delete con2;
        
        Contact con3 = new Contact();
        con3.LastName ='tesst contact1';
        con3.AccountId = acc.Id;
        con3.Id=con.id;
        undelete con3;
        
    }
}