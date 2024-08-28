@istest
public class updateAccountIndustryBatch_Test {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.Name = 'test account';
        acc.Industry ='Banking';
        insert acc;
        system.debug('account insert '+acc.Id);
      
      list<Account> acclist1 =[SELECT id, industry, name FROM Account];
     
        test.startTest();
        updateAccountIndustryBatch a = new updateAccountIndustryBatch();
        database.executeBatch(a,200);
        test.stopTest();
    }
}