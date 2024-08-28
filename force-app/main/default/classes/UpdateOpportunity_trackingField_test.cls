@istest
public class UpdateOpportunity_trackingField_test {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.Name ='test account';
        acc.Industry ='Energy';
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.AccountId=acc.Id;
        opp.Name='test opp name';
        opp.CloseDate=date.newInstance(2018, 12, 30);
        opp.StageName='Closed Won';
        opp.Type ='New Customer';
        insert opp;
        
        test.startTest();
        UpdateOpportunity_trackingField a = new UpdateOpportunity_trackingField();
        database.executeBatch(a,200);
        test.stopTest();
    }
}