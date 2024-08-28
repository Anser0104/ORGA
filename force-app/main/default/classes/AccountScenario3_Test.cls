@istest
public class AccountScenario3_Test {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.Name = 'test account';
        acc.Industry ='Energy';
      //  acc.ParentId = 'Mr.Anser';
        insert acc;
    }
}