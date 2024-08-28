public class UpdateStudentage_batchapex implements database.Batchable<sObject> {
  public Database.QueryLocator start(database.BatchableContext bc){
        string qry ='SELECT Id,Name,Student_Age__c FROM Students_Detail__c';
        return database.getQueryLocator(qry);
    }
    public void execute(database.BatchableContext bc, list<Students_Detail__c> stdslist){
        List<Students_Detail__c> stdslistToUpdate = new list<Students_Detail__c>();
        for(Students_Detail__c stds: stdslist)
        {
            if(stds.Student_Age__c== null)
            {
                stds.Student_Age__c = 25;
                stdslistToUpdate.add(stds);
            }
        }
        if(stdslistToUpdate.size()>0)
        {update stdslistToUpdate;}
    }
    public void finish(database.BatchableContext bc){
        
    }
}