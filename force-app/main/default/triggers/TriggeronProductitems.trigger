trigger TriggeronProductitems on Cs_ProductItem__c (before delete) 
{
    Map<Id, Cs_ProductItem__c> prodMap = new Map<Id, Cs_ProductItem__c>([Select Id,(select Id From Custom_Orders__r) FROM Cs_ProductItem__c WHERE Id IN:trigger.old]);
    
    for(Cs_ProductItem__c csprod:trigger.old)
    {
        if(prodMap.get(csprod.Id).Custom_Orders__r.size()>0)
        {
            csprod.addError('You cant not delete the Productitem if it has associated with Orders');
        }
    }
}