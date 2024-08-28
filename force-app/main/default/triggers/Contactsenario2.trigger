trigger Contactsenario2 on Contact (after update) {
    list<messaging.SingleEmailMessage> mailstosend = new list<messaging.SingleEmailMessage>();
   /* for(Contact con: trigger.new)
    {
        if(con.Email!=null)
        {
        messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
      	string[] toAddress =new string[]{con.Email};
        msg.setToAddresses(toAddress);
       msg.setSubject('This is a Trigger Email');
        String body = 'Dear ' + con.LastName + ', ';
       body += 'This is a base url link:';
       body += 'https://hcl518-dev-ed.lightning.force.com/lightning/o/Contact/list?filterName=00B5g00000LlNMoEAN';
    
      msg.setHtmlBody(body);
            mailstosend.add(msg);
        }
    }
            messaging.sendEmail(mailstosend);*/

}