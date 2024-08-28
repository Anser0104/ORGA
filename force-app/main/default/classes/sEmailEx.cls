public class sEmailEx {

    public static void sendEmailToId(){
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        string[] toAddress = new String[]{Label.EmailAddressLabel};
            msg.setToAddresses(toAddress);
        string[] ccAddress = new String[]{'mubarakbasha.sf1@gmail.com'};
            msg.setCcAddresses(ccAddress);
       
        msg.setSubject('test Subject ');
        msg.setPlainTextBody('this is a body');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {msg});
       
    }
}