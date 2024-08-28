public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accounts){
        for(Account acc:accounts){   
            if(acc.BillingState != acc.ShippingState){
                acc.ShippingState = acc.BillingState;
            }                        
        }        
    }
}