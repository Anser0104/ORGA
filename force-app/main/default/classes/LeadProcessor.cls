public class LeadProcessor implements database.Batchable<sObject> {
    public database.QueryLocator start(database.BatchableContext bc)
    {
       string qry = 'SELECT Id,Name,LeadSource FROM Lead';
       return database.getQueryLocator(qry);
    }
    public void execute(database.BatchableContext bc, list<Lead> leadlist)
    {
        list <Lead> leadlistToUpdate =new list<Lead>();
        for(Lead lea: leadlist)
        {
            lea.LeadSource = 'Dreamforce';
			leadlistToUpdate.add(lea);           
        }
        if(!leadlistToUpdate.isEmpty()){
            update leadlistToUpdate;
        }
        
    }
    public void finish(database.BatchableContext bc)
    {
       
    }
}