public class updateDateOnAccountHandlerClass {
    public static void updateDateOnAccountMethod(List<Account> acclist,Map<Id,Account> OldAccMap){
        List<Contact> upadateConList = new List<Contact>(); 
        set<ID> accIds = new set<ID>();
        for(Account acc:acclist){
            if(OldAccMap.get(acc.Id).First_Sale_Date__c != acc.First_Sale_Date__c){
                accIds.add(acc.Id);
                system.debug('accIds: '+accIds);
            }
        }  
        List<Contact> ConList =[select Effective_Date__c,Account.First_Sale_Date__c from Contact where AccountId IN : accIds];
        for(Contact con: Conlist){
            con.Effective_Date__c = con.Account.First_Sale_Date__c;
            upadateConList.add(con);
            system.debug('Updated list :'+upadateConList);
        }
        if(!upadateConList.isEmpty()){
            update upadateConList;   
        }
    }
}