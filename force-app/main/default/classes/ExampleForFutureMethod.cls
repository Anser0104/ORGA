public class ExampleForFutureMethod {
	@future
    public static void accountFieldUpdated(List<Id> accIds){
        List<Account> accountlist = new List<Account>();
        for(Id Ids: accIds){
           Account acc = [SELECT Name from Account where Id =:accIds];
            acc.Number_Of_Contacts__c =	[SELECT count() from Contact where AccountId =:accIds];
            accountlist.add(acc);
        }
        update accountlist;
    }
    public ExampleForFutureMethod(){
        list<Account> acctlist = [select Id from Account];
        list<Id> accountids = new list<Id>();
        for(Account ac:acctlist){
            accountids.add(ac.Id);
        }
        ExampleForFutureMethod.accountFieldUpdated(accountids);
    }
    
}