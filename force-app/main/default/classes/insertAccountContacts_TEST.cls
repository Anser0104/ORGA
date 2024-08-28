@istest
public class insertAccountContacts_TEST {
    public static testmethod void verifydata(){
              
        List<Account> aaclist = [SELECT id, name, (SELECT id, name FROM Contacts) FROM Account];
        
        Account acc = new Account();
        acc.Name ='test name';
        acc.Industry='Banking';
        insert acc;
        system.debug('account insert'+acc.Id);
        
        

     

             
        test.startTest();
        insertAccountContacts a = new insertAccountContacts();
        database.executeBatch(a,200);
        test.stopTest();
    }
}