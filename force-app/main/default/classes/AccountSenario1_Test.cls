@istest
public class AccountSenario1_Test {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.Name ='test acc1';
        acc.Industry='Banking';
        insert acc;
        
        Account acc1 = new Account();
        acc1.Name ='test acc1';
        acc1.Industry='Education';
        acc1.Id = acc.id;
        update acc1;
        
    }
}