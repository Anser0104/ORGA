global class UpdateExistingOpportunities implements database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id,StageName FROM Opportunity');
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList){
        list<Opportunity> optylstToUpdate = new list<Opportunity>();
        for(Opportunity oppo: oppList){
           if(oppo.StageName == 'Prospecting'){
           // Opportunity opty = new Opportunity();
           		oppo.StageName = 'Negotiation/Review';
              // opty.StageName = 'Negotiation/Review';
               optylstToUpdate.add(oppo);
        	} 
        }
        if(optylstToUpdate.size()>0){
            try{update optylstToUpdate;}
            catch (Exception ex){
                system.debug('Error message' +ex.getMessage());
            }
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }
}