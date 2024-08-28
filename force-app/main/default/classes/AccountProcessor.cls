public class AccountProcessor {
    @future
    public static void countContacts(list<Id> accrecordids){
        list<Account> acclst =[SELECT Id, Name,Number_Of_Contacts__c,
        (SELECT Id,LastName, AccountId FROM Contacts) FROM Account WHERE Id IN:accrecordids];
        for(Account acc: acclst){
            acc.Number_Of_Contacts__c=acc.Contacts.size();
        }
        update acclst;
    }
}