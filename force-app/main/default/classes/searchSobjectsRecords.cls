public  with sharing class searchSobjectsRecords {
 @AuraEnabled(cacheable=true)
    public static List<SObject> searchRecordsData (String keyword)
    {
        List<List<SObject>> searchResults =  [FIND :keyword IN ALL FIELDS RETURNING Account(Name,Phone,Email__c,Industry),Lead(Name,Phone,Email),Contact(Name,Phone,Email)];
        return (SObject[])searchResults[0];
    }
}