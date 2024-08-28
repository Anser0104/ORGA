public class ApexControllerForAccpontRecords {
@AuraEnabled
    public static list<Account> getAccounts(){
        return [Select id, Name, Phone,AccountNumber FROM Account limit 10];
    }
}