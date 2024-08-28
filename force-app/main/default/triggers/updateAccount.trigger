//Whenever CustomObjectA record is created , based on employee type on CustomObjectA record update value of comments on ,account.
trigger updateAccount on CustomObjectA__c (After insert) 
{
    set<id> accIdSet = new set<id>();
    for(CustomObjectA__c objA : trigger.new){
        if((objA.Employee_Type__c!=null || objA.Employee_Type__c!='') && (objA.Comments__c!=null ||objA.Comments__c!='')){
            accIdSet.add(objA.AccountId__c);
        }
    }
    
    if(accIdSet.size()>0)
    {
        List<Account> accListToUpdate = new List<Account>();
        for(Account acc:[SELECT id, Employee_update__c, Manager_Update__c,(SELECT id, Employee_Type__c, Comments__c FROM CustomObjectAs__r ORDER BY CreatedDate DESC LIMIT 1) FROM Account WHERE  id IN: accIdSet])
        {
            if(acc.CustomObjectAs__r.size()>0){
                CustomObjectA__c custObjA = acc.CustomObjectAs__r[0];
                if(custObjA.Employee_Type__c=='Manager.'){
                    acc.Manager_Update__c = custObjA.Comments__c;
                }else if(custObjA.Employee_Type__c=='Employee.'){
                    acc.Employee_update__c = custObjA.Comments__c;
                }
                accListToUpdate.add(acc);
            }
        }
        if(accListToUpdate.size()>0)
        {
                try{
                update accListToUpdate;
            }
            catch(exception ex){
                system.debug('exception is '+ex.getMessage());
            }
        }
    }
}