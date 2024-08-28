public class auraIterationExxample {

    @AuraEnabled
    public static List<Account> getAccountRecords(){
        return [SELECT Id, Name, Industry FROM Account LIMIT 10];
    }
}