public class SendEmailToCustomer implements database.Batchable<sobject> {
    public database.QueryLocator start(database.BatchableContext bc)
    {
    string qry = '';
qry =
'SELECT Id,Name,PO_Status__c,Customer_Email__c,Customer_Name__c,Customer_Name__r.Email__c  FROM Flipkart__c WHERE Customer_Name__c != NULL';
     return database.getQueryLocator(qry);
    }
    public void execute(database.BatchableContext bc, list<Flipkart__c> fliplist){
        for(Flipkart__c fi: fliplist)
        {
            if(fi.Customer_Email__c =='' || fi.Customer_Email__c ==null)
            {fi.Customer_Email__c = fi.Customer_Name__r.Email__c ;}
        	
      messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
       string[] toAddress =new string[]{fi.Customer_Email__c};
        msg.setToAddresses(toAddress);
        msg.setSubject('This is Email for Flipkart customers');
        msg.setPlainTextBody('GoodEvening sir, thank you for being patience with us, We are working on your request');
        messaging.sendEmail(new messaging.SingleEmailMessage[]{msg});
        }
        
    }
    public void finish(database.BatchableContext bc) {}   
	
}