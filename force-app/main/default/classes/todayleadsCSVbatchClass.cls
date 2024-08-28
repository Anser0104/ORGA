global class todayleadsCSVbatchClass implements Database.Batchable<sobject>,Database.stateful{
    global List<Lead> allleads = new List<Lead>();
    global Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('start method');
        return Database.getQueryLocator('SELECT Id,Name,Company,Email,Phone FROM Lead');
    }
    global void execute(Database.BatchableContext BC, List<Lead> leadslist){
        system.debug('Execute method');
        allleads.addALL(leadslist);
    }
    global void finish(Database.BatchableContext BC){
        system.debug('Finish method'+allleads.size());
        String finalstr = 'Id, Name, Company, Email, Phone \n';
        String attachmentName = 'Lead Data-' +Date.today()+ '.csv';
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        Messaging.EmailFileAttachment[] emailsAttachment = new List<Messaging.EmailFileAttachment>();
        
        for(Lead lea:allleads)
        {
            String recordString =  '"'+lea.Id+'","'+lea.Name+'","'+lea.Company+'","'+lea.Email+'","'+lea.Phone+'"\n';  
            finalstr = finalstr+recordString;
        }
        Messaging.EmailFileAttachment fileattach = new  Messaging.EmailFileAttachment();
        fileattach.setFileName(attachmentName);
        fileattach.setBody(Blob.valueOf(finalstr));
        emailsAttachment.add(fileattach);
         mail.setSubject( 'Todays Lead Report' );
        mail.setToAddresses( new String[] {'nossamanser37@gmail.com'} );
        mail.setPlainTextBody( 'Please find attchment for Todays Leads Report' );
        mail.setFileAttachments(emailsAttachment);
        Messaging.SendEmailResult [] Results =
            Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}