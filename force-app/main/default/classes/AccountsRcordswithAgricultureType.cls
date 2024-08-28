public class AccountsRcordswithAgricultureType {
@AuraEnabled
    public static list<Account> getAcc(){
        list<Account> acclst = [SELECT Id,Name,Industry,AccountNumber FROM Account WHERE Industry ='Agriculture' LIMIT: limits.getQueryRows()];
        Return acclst;
    }
}