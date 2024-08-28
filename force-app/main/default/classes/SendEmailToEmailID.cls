public class SendEmailToEmailID {
    public static VOID sendemailtoID(list<Flipkart__c> fliplist){
        for(Flipkart__c fi: fliplist){
        messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
      	string[] toAddress =new string[]{fi.Customer_Email__c};
        msg.setToAddresses(toAddress);
        msg.setSubject('This is Email for Flipkart customers');
        msg.setPlainTextBody('GoodEvening sir, thank you for being patience with us, We are working on your request');
        messaging.sendEmail(new messaging.SingleEmailMessage[]{msg});
        }
      
    }
}