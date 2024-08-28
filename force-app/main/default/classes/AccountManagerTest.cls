@isTest
    private class AccountManagerTest {
        
        @isTest static void testGetContactsByAccountId(){
            id recordId = createTestRecord();
            RestRequest request =new RestRequest();
            request.requestURI ='https://hcl518-dev-ed.lightning.force.com/services/apexrest/Accounts/'+ recordId +'/contacts';
            request.httpMethod ='GET';
            RestContext.request = request;
            Account thisaccount = AccountManager.getAccount();
            system.assert(thisaccount != null);
            system.assertEquals('Test Record', thisaccount.Name);
            
        }
       private static Id createTestRecord(){
            Account accTest = new Account(
                Name ='Test Record'
            );
            insert accTest;
            Contact conTest = new Contact(
                FirstName ='jhone',
                LastName ='neo',
                AccountId =accTest.Id       
            );
            insert conTest;
            
            return accTest.id;
        }
    }