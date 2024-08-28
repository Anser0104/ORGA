@isTest
public class AccountTriggerTest {    
    @isTest static void TestCreate200Records(){ 
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i, BillingState='CA');
            accts.add(acct);
        }              
        // Perform Test
        Test.startTest();
        Database.Insert(accts, false);        
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT Id,ShippingState,BillingState FROM Account WHERE ShippingState ='CA'];
        System.assertEquals(200, verifyAccts.size());
        system.debug('verifyAccts :'+verifyAccts.size());
        for(Account a:verifyAccts){
            system.debug('ShippingState :'+a.ShippingState);
        }
    }
}