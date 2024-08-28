public class UpdateOpportunity_trackingField implements database.Batchable <sObject> {
 public Database.QueryLocator start(database.BatchableContext bc)
    {
        string qry ='SELECT id,Type,TrackingNumber__c,AccountId,Account.Name,Account.ParentId FROM Opportunity';
        return database.getQueryLocator(qry);
    }
    public void execute(database.BatchableContext bc, list<Opportunity> OPPlist)
     {
        List<Opportunity> OPPlistToUpdate = new list<Opportunity>();
        for(Opportunity OPPO: OPPlist)
        {
            if((OPPO.Type == 'New Customer')&& (OPPO.TrackingNumber__c==''|| OPPO.TrackingNumber__c== null)
               && OPPO.AccountId!= NULL)
            {
                OPPO.TrackingNumber__c = (OPPO.Account.Name).substring(0,12);
                OPPlistToUpdate.add(OPPO);
            }
        }
        if(OPPlistToUpdate.size()>0)
        {update OPPlistToUpdate;}
     }
    public void finish(database.BatchableContext bc){
        
    }
}