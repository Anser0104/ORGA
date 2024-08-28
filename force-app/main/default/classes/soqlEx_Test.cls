@istest
public class soqlEx_Test {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.name ='test account';
        acc.Industry='null';
        insert acc;
     
        List<Account> accList = new List<Account>();
        accList = [SELECT id, name, industry from account WHERE industry ='null'];

        
        soqlEx a = new soqlEx();
        a.soqlExample();
    }
}