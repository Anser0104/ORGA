trigger opportyfutureTrigger on Opportunity (before insert,after insert, after update) 
{
    if((trigger.isInsert || trigger.isUpdate) && trigger.isAfter)
    {
        opportyfutureTriggerHandler.Opporecords(trigger.new,trigger.oldMap);
    }
}