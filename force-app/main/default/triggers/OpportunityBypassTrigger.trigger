trigger OpportunityBypassTrigger on Opportunity (before insert, 
                                                 after insert, 
                                                 before update, 
                                                 after update,
                                                 before delete,
                                                 after delete) 
{
    Opportunity Oppor = new Opportunity();
    MyCustomSetting__c objsetting = MyCustomSetting__c.getValues('ValidationCheckbox__c'); 
    
    if(objsetting.ValidationCheckbox__c){
        TotalOpportunityTriggerHandler tp = new TotalOpportunityTriggerHandler();
        
        if(Trigger.isInsert && Trigger.isAfter){
            
            tp.TotalField(Trigger.new);
            Oppor.ValidationCheckbox__c = False;
        }
        else if (Trigger.isUpdate && Trigger.isAfter){
            
            tp.TotalField(Trigger.new);
            Oppor.ValidationCheckbox__c = False;
        }
        else if(Trigger.isDelete && Trigger.isAfter){
            
            tp.TotalField(Trigger.old);
            Oppor.ValidationCheckbox__c = False;
        }
    }
}