global class ProintAccountsBatchApex implements Database.Batchable<sObject> {
    List<Account> accountlist = new List<Account>();
    
    global ProintAccountsBatchApex(List<Account> accountsRecords){
        accountlist = accountsRecords;
        system.debug('Accounts from Trigger :'+accountsRecords);
    }
    global List<Account> start (Database.BatchableContext bc){
        system.debug('Accounts from Class List variable :'+accountlist);
        Return accountlist;
    }
    global void execute(Database.BatchableContext bc, List<Account> acclist){
        system.debug('Accounts from Start Method :'+acclist);
        for(Account acc: acclist){             
            system.debug('Accounts :'+acc.Name);
            system.debug('Accounts :'+acc.Rating);
            system.debug('Accounts :'+acc.Industry);
        }
    }
    global void finish(Database.BatchableContext bc){
        
    }
}