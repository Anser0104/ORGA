trigger NoOrderTakenTigger on Cs_Order__c (before insert) {
    list<Id> prolst = new list<Id>();
    for(Cs_Order__c csorder: trigger.new){
        prolst.add(csorder.ProductItems__c); 
    }
Map <Id, Cs_ProductItem__c> proMap = new Map<Id,Cs_ProductItem__c>
([SELECT Id,Products_Left__c,Total_Ordered_Units__c,(select id,ProductItems__c, Quantity__c from Custom_Orders__r) from Cs_ProductItem__c WHERE Id IN:prolst]);
    
    for(Cs_Order__c csord:trigger.new){
        if(csord.Quantity__c > proMap.get(csord.ProductItems__c).Products_Left__c)
        {
            csord.Quantity__c.addError('Sorry Oder can not be taken because ordered units are more than stock available');            
        }
    }
    
}