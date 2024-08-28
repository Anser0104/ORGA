public class databaseDMLEx {
    
    public static void doDatabaseInsert(){
        List<Account> accList = new List<Account>();
        
        Account acc1 = new Account();
        acc1.Name = 'test 12 from apex';
        acc1.Industry = 'Education';
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'test 11 from apex';
        accList.add(acc2);
        
        Database.SaveResult[] srList = Database.insert(accList, false);
        
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
    
    public static void doInsert(){
        List<Account> accList = new List<Account>();
        
        Account acc1 = new Account();
        acc1.Name = 'test 1 from apex';
        acc1.Industry = 'Education';
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'test 2 from apex';
        accList.add(acc2);
        try{
            insert accList;
        }
        catch(exception ex){
            system.debug('error is '+ex.getMessage());
        }
    }
    
}