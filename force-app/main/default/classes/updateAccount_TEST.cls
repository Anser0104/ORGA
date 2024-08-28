@istest
public class updateAccount_TEST {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.Name='test ac1';
        acc.Industry='Banking';
        insert acc;
     
        Account acc1 = new Account();
        acc1.Name='test ac1';
        acc1.Industry='Education';
        insert acc1;
        
         Account acc2 = new Account();
        acc2.Name='test ac1';
        acc2.Industry='Education';
        insert acc2;
        
        CustomObjectA__c cus1 = new CustomObjectA__c();
        cus1.Name ='test con1';
        cus1.Employee_Type__c='Manager.';
        cus1.Comments__c='Test Manager comments';
        cus1.AccountId__c = acc.id;
        insert cus1;
        
        CustomObjectA__c cus = new CustomObjectA__c();
        cus.Name ='test con2';
        cus.Employee_Type__c='Employee.';
        cus.Comments__c='Test Employee comments';
        cus.AccountId__c = acc1.id;
        insert cus;
        
        CustomObjectA__c cus2 = new CustomObjectA__c();
        cus2.Name ='test con2';
        cus2.Employee_Type__c='Employee.';
        cus2.Comments__c='Test Employee comments';
        cus2.AccountId__c = acc2.id;
        insert cus2;
        
            set<id> accIdSet = new set<id>();
        List<Account> acct=[SELECT id, Employee_update__c, Manager_Update__c,(SELECT id, Employee_Type__c, Comments__c FROM CustomObjectAs__r ORDER BY CreatedDate DESC LIMIT 1) FROM Account WHERE  id IN: accIdSet];
       
    }
}