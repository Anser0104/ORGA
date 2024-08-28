public class DatabaseExample {
	public static void dodatabaseinsert()
    {
        list<Account> acclist = new list<Account>();
        
        Account acc = new Account();
        acc.Name ='TEST AC 111';
        acc.Industry ='Education';
        acclist.add(acc);
        
        Account acc1 = new Account();
        acc1.Name ='TEST AC 222';
        acclist.add(acc1);
        
        Database.SaveResult[] srList = Database.insert(acclist, false);

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
}