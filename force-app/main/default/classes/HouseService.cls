public with sharing class HouseService {
    @AuraEnabled(cacheable=true)
    public static List<House__c> getRecords(){
        try{
            List<House__c> lstHouses =
                [select Id,
                 Name,
                 Address__c,
                 State__c, 
                 City__c,
                 Zip__c
                 FROM House__c
                 WITH SECURITY_ENFORCED 
                 ORDER BY CreatedDate
                 LIMIT 10];
            return lstHouses;
        }
        catch(exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
}