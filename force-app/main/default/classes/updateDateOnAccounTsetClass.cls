@isTest
public class updateDateOnAccounTsetClass {
@isTest
    static void updateDateOnAccountMethod(){
       List<Account> acclist= new list<Account>(); 
        Account acc1 = new Account(Name='T account1', First_Sale_Date__c =Date.today());
         Account acc2 = new Account(Name='T account2', First_Sale_Date__c =Date.today().addDays(-1));
        insert new List<Account>{acc1,acc2}; 
            
            Contact con1 = new Contact(LastName='T Contact1', AccountId =acc1.Id, Effective_Date__c= Date.today().addDays(-1));
       		Contact con2 = new Contact(LastName='T Contact2', AccountId =acc2.Id, Effective_Date__c= Date.today());
        insert new List<Contact>{con1,con2};
            
            Map<Id, Account> OldAccMap = new Map<Id, Account>();
            OldAccMap.put(acc1.Id, new Account(First_Sale_Date__c =Date.today().addDays(-1)));
        	OldAccMap.put(acc2.Id, new Account(First_Sale_Date__c =Date.today()));
        
        Test.startTest();
        updateDateOnAccountHandlerClass.updateDateOnAccountMethod(new List<Account>{acc1,acc2}, OldAccMap);
        Test.stopTest();
        
        Contact Updatedcontact1 = [Select Effective_Date__c from Contact where Id =: con1.Id];
        system.assertEquals(acc1.First_Sale_Date__c, Updatedcontact1.Effective_Date__c);
        system.debug('AccUpdatedDate'+acc1.First_Sale_Date__c);
        system.debug('ConUpdatedDate'+Updatedcontact1.Effective_Date__c);
    }
}