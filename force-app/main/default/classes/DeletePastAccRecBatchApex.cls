global class DeletePastAccRecBatchApex implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
   		
        String query = 'SELECT Id,Name,CreatedDate FROM Account where CreatedDate = LAST_N_DAYS:30 OR CreatedDate = LAST_N_MONTHS:1 OR CreatedDate = LAST_N_YEARS:1' ;
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> acclist) {
      
         Delete acclist;   
        
    }
    global void finish(Database.BatchableContext BC) {
       
    }
}