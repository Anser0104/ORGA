@isTest
public class AccountProcessorTest {
    @isTest static void TestcountContacts(){
       
        Account ac =new Account();
        ac.Name = 'test acc1';
        system.debug('accid'+ac.Id);
        insert ac;
        
        Contact con =new Contact();
        con.FirstName ='honey';
        con.LastName ='james2';
        con.AccountId=ac.Id;
        insert con;
        
        list<Id> accrecordIds = new list<Id>();
        accrecordIds.add(ac.Id);
        
       Test.startTest();
        AccountProcessor.countContacts(accrecordIds);
        Test.stopTest();
       Account acc= [SELECT Number_Of_Contacts__c FROM Account WHERE Id =:ac.Id];
        system.assertEquals(acc.Number_Of_Contacts__c, 1);
    }
}