@ISTEST	
public class UpdateMrToAccount_BatchApex_TEST {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.Name ='test Account name';
        acc.Industry ='Banking';
        insert acc;
        
        test.startTest();
        UpdateMrToAccount_BatchApex a = new UpdateMrToAccount_BatchApex();
        database.executeBatch(a);
        test.stopTest();
    }
}