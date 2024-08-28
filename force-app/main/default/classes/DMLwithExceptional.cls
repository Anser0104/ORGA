public class DMLwithExceptional {
	public void doinsertEX()
        {
            Account acc = new Account();
            acc.Name ='MY ACC2 2021';
            
            Contact con = new Contact();
            con.Level__c ='Secondary';
            con.LastName ='my contact 22';
            insert con;
            
           try{
                insert acc;
            }
            catch(exception ex){
                system.debug('error is: '+ex.getMessage());
            }
            
        }
}