public class PropertyUtility {
	 public static void newListedProperties(){
        list<Property__c> newPropList = new list<Property__c>();
        	newPropList = [SELECT Name,Broker__r.Email__c,Days_On_Market__c FROM Property__c
                          WHERE Days_On_Market__c <=30];
        for(Property__c proty: newPropList){
            String propEmail = proty.Name + ':' + proty.Broker__r.Email__c ;
            system.debug('propEmail :' +propEmail);                  
        }
    }
}