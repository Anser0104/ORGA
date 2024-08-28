/**
 * @description       : This is the Batch class for Stored Procedure to Delete Past Operating Hour Records in SFHC.
 * @author            : Nossam Anser Basha
 * @last modified on  : November-25-2022
 * @last modified by  : Nossam Anser Basha
 **/
global class DeletePastRealtedCONRecords implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
     string recid = '0015g000013mVJwAAM';
    String query = 'SELECT id,name,AccountId,Effective_Date__c,Weekday_Name__c from Contact WHERE AccountId =: recid  AND effective_Date__c  < TODAY ORDER By Effective_Date__c DESC,Weekday_Name__c' ;
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Contact> conlist) {
        Map<String,List<Contact>> conMap = new Map<String,List<Contact>>();
        
        List<Contact> ListToDelete = new List<Contact>();
        for(Contact cn : conlist){
            
            List<Contact> tempList = new List<Contact>();
            if(conMap.containsKey(cn.AccountId+'@@'+cn.Weekday_Name__c)){
                
                tempList = conMap.get(cn.AccountId+'@@'+cn.Weekday_Name__c);
                tempList.add(cn);
            }            
            
            conMap.put(cn.AccountId+'@@'+cn.Weekday_Name__c,tempList);
                
        }
        for( List<Contact> OPHlist: conMap.values()){
            ListToDelete.addALL(OPHlist);
        }
        Delete ListToDelete;   
    }
    global void finish(Database.BatchableContext bc) {
       
    }
}