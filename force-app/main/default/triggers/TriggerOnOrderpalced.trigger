trigger TriggerOnOrderpalced on Cs_Order__c (after insert,after update) {
    if(trigger.isafter){
        if(trigger.isinsert){
            
			ProductitemleftHandlerClass.ProductitemleftHandlerInsertMethod(trigger.new);
            system.debug('While insertqing order produt let in stock'+trigger.new);
        }
        if(trigger.isupdate){
             ProductitemleftHandlerClass.ProductitemleftHandlerUpdatetMethod(trigger.new,trigger.oldMap);
            system.debug('While updateing order produt let in stock'+trigger.new);
        }
    }
}