@istest
public class updateAccount1_TEST {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.Name='test a1';
        acc.Industry='Banking';
        acc.Count_checkbox__c=false;
        insert acc;
        
        Account acc1 = new Account();
        acc1.Name='test a2';
        acc1.Industry='Banking';
        acc1.Count_checkbox__c=true;
        acc1.Id = acc.Id;
        update acc1;
        
        Account acc2 = new Account();
        acc2.Name='test b1';
        acc2.Industry='Banking';
        acc2.Count_checkbox__c=false;
        insert acc2;
        
         Account acc3 = new Account();
        acc3.Name='test b2';
        acc3.Industry='Banking';
        acc3.Count_checkbox__c=true;
        acc3.Id = acc2.Id;
        update acc3;
        
        Contact con =new Contact();
        con.LastName = 'test contact';
        con.AccountId = acc1.id;
        insert con;
        
        Contact con2 =new Contact();
        con2.LastName = 'test contact';
        con2.AccountId = acc2.id;
        insert con2;
    }
}