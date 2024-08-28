public class AccountControllerTest1 {
@AuraEnabled
    public static list<Account> getAccountRecords(){
        return [ select Id, Name, Email__c, AnnualRevenue from Account limit 10];
    }
    @AuraEnabled
    public static Account getAccountDetails(String accountId) {
        return [SELECT Id, Name, Email__c, AnnualRevenue FROM Account WHERE Id = :accountId];
    }
     @AuraEnabled
    public static Account editAccountDetails(String accountrecId) {
        return [SELECT Id, Name, Email__c, AnnualRevenue FROM Account WHERE Id = :accountrecId];
    }
     @AuraEnabled
    public static void saveAccountDetails(Account account) {
        update Account;
    }
}