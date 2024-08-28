public with sharing class CreateAccountController {
    @AuraEnabled
    public static void createAccount(String accountName, String email, Decimal annualRevenue) {
        try {
            Account newAccount = new Account();
            newAccount.Name = accountName;
            newAccount.Email__c = email;
            newAccount.AnnualRevenue = annualRevenue;

            insert newAccount;
        } catch (Exception e) {
            throw new AuraHandledException('Error creating account: ' + e.getMessage());
        }
    }
}