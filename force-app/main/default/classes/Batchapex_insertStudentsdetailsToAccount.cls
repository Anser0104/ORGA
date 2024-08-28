public class Batchapex_insertStudentsdetailsToAccount implements Database.Batchable<sObject> 
{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        string qry = 'SELECT id, Name, (SELECT Id,Name,Mobile_number__c FROM Students_Details__r) FROM Account';
        return database.getQueryLocator(qry);
    }
    public void execute(Database.BatchableContext bc, list <Account> acclist)
    {
      list<Students_Detail__c> stdslist = new list<Students_Detail__c>();
        for(Account acc: acclist)
        {
            if(acc.Students_Details__r.size()==0)
            {
                //insert two students details
                Students_Detail__c stds1 = new Students_Detail__c();
                stds1.Name = acc.Name;
                stds1.Mobile_number__c = '(415) 901-7000';
                stds1.Account__c = acc.Id;
                stdslist.add(stds1);
                
                Students_Detail__c stds2 = new Students_Detail__c();
                stds2.Name = acc.Name;
                stds2.Mobile_number__c ='(415) 901-7000';
                stds2.Account__c = acc.Id;
                stdslist.add(stds2);
            }
            else if(acc.Students_Details__r.size()==1)
            {
                //insert one record
                Students_Detail__c stds = new Students_Detail__c();
                stds.Name = acc.Name;
                stds.Mobile_number__c ='(415) 901-7000';
                stds.Account__c = acc.Id;
                stdslist.add(stds);
            }
         }
        if(stdslist.size()>0)
        {
            insert stdslist;
        }
        
    }
    public void finish(Database.BatchableContext bc)
    {
        Database.executeBatch(new UpdateStudentage_batchapex());
    }
}