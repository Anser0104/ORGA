public with sharing class accountSearch {
    @AuraEnabled(Cacheable = true)
    public static List<Account> getAccountRecords(String searchkey,Id recordId){
        string searchKeyword = '%'+ searchkey + '%';
        List<Account> acclist = new List<Account>();
        for(Account acc: [SELECT ID,Name,Industry, Phone, Type From Account WHERE Name LIKE :searchKeyword]){
            acclist.add(acc);
        }
        if(acclist.size() == 0){
            throw new AuraHandledException('No Record Found..');
        }
        return acclist;
    }
}