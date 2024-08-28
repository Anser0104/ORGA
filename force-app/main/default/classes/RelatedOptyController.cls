public class RelatedOptyController {
    @auraEnabled
    public static List<OppotyWrapper> getoppoRecords(String accountId){
        List<OppotyWrapper> wrapperlist = new List<OppotyWrapper>();
        for(Opportunity opp: [SELECT Id, 
                              Name,
                              CloseDate,
                              StageName 
                              FROM Opportunity 
                              WHERE AccountId =:accountId])
        {
            OppotyWrapper oppowrapper = new OppotyWrapper(false,opp);
            wrapperlist.add(oppowrapper);           
        }
        Return wrapperlist;
    }
    public class OppotyWrapper{
        @AuraEnabled public boolean isSelect {get;set;}
        @AuraEnabled public Opportunity oppty {get;set;}
        public OppotyWrapper(boolean isSelect,Opportunity objcon){
            this.isSelect = isSelect;
            this.oppty = objcon;
        }
    }
}