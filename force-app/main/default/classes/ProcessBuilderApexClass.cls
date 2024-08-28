public class ProcessBuilderApexClass {
@InvocableMethod
    public static void updateCollege(List<Id> ids){
        system.debug('ids==>' +ids);
        
        List<College__c> l = [select id,Fees__c from college__c where Id in :ids ];
        
        for(College__c eachCollege: l){
            eachCollege.Fees__c = 35000;
        } 
        Update l;
    }
}