public class IterateRecordsAura {

    @AuraEnabled
    public static list<Account> listoutRecords()
    {
        return [SELECT Id, Name, Industry FROM Account limit 10];
    }
}