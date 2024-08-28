@isTest
public class AddPrimaryContactTest {
    @isTest static void testlst(){
        list<Account> aclst = new List<Account>();
        for(integer i=0; i<50; i++){
          aclst.add(new Account(Name='Test' +i, Billingstate ='CA'));
        }
        for(integer j=0; j<50; j++){
            aclst.add(new Account(Billingstate ='NY', Name ='test' +j));
        }
        insert aclst;
        
        Contact con = new Contact();
        con.FirstName='DEMO';
        con.LastName='Test';
        insert con;
        
        string state='CA';
        
        AddPrimaryContact adpc = new AddPrimaryContact(con,state);
        Test.startTest();
        system.enqueueJob(adpc);
        Test.stopTest();   
    }
}