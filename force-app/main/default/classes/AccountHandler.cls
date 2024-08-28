public class AccountHandler {
    public static Account insertNewAccount(String accName){
       Account acc = new Account();
               acc.name = accName;
        	   acc.Industry ='Education';
        try{
            insert acc;
                      
        system.debug('insreted '+acc.name);
        return acc;
        }
        catch(Exception e){
        system.debug('Exception');   
        return null;
    }
    }
    public static void insertAccount(Integer value){
        Integer N = 1;
       list<Account> addAccounts = new  list<Account>();
          while(N <= value){
          
            Account acc = new Account();
            acc.Name = 'Acme Inc' + N;
            acc.AccountNumber = 'A000n' + N;
            addAccounts.add(acc);
            system.debug('List of Accounts: '+ addAccounts);
            N = N+1;
            system.debug('N value : ' +N);
        }
        Insert addAccounts;
    }
    }