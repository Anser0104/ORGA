public class UpdateMrToAccount_BatchApex implements database.Batchable<sObject> {
	public Database.QueryLocator start(database.BatchableContext bc)
    {
        string qry ='SELECT id,Name FROM Account';
        return database.getQueryLocator(qry);
    }
    public void execute(database.BatchableContext bc, list<Account> acclist)
    {
        List<Account> acclistToUpdate = new list<Account>();
        for(Account acc: acclist)
        {
   
                  acc.Name = 'Mr.'+acc.Name;
                  acclistToUpdate.add(acc);
          
        }
        update acclistToUpdate;
    }
    public void finish(database.BatchableContext bc)
    {
        
    }

}