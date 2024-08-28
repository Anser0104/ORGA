public class updateAccountIndustryBatch implements Database.Batchable<sobject>{

	public Database.QueryLocator start(Database.BatchableContext bc){
	
        string BankingStr='Banking';
		return Database.getQueryLocator('SELECT id, industry, name FROM Account');
	}
	public void execute(Database.BatchableContext bc, List<Account> accList){
       List<Account> acclisttoupdate = new list<Account>();
        for(Account acc: accList)
        {
            acc.Industry ='Education';
            acclisttoupdate.add(acc);
        }
        update acclisttoupdate;
		
	}
	public void finish(Database.BatchableContext bc){
	
	}
}