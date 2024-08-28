trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
   List<Task> tasklst = new List<Task>();
    for(Opportunity opp:Trigger.new){
        if(opp.stageName=='Closed Won'){
            tasklst.add(new task(Subject='Follow Up Test Task', WhatId=opp.Id));
        }
    }
    if(tasklst.size()>0){
        insert tasklst;
    }
}