public class opportyfutureTriggerHandler 
{
    public static void Opporecords(List<Opportunity> opptylist, Map<Id,Opportunity> oldopptyMap)
    {
        system.debug('NormalMethod=====>');
        list<Id> oppIds =new list<Id>();
        for(Opportunity opp: opptylist)
        {//after insert
            if(oldopptyMap == null && opp.StageName =='Closed won'){
                oppIds.add(opp.Id);
            }//after update
            else if(opp.StageName =='Closed won' && oldopptyMap != null && opp.StageName != oldopptyMap.get(opp.Id).StageName){
                oppIds.add(opp.Id);
            }
        }
        if(!oppIds.isEmpty()){
            semdEmail(oppIds);
        }
    }
    @Future
    public static void semdEmail(list<Id> optyId){
      system.debug('FutureMethod=====>');
        
         
        list<Messaging.SingleEmailMessage> mail = new list<Messaging.SingleEmailMessage>();
        messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
       string[] toAddress = new string[]{'nossamanser37@gmail.com'};
        msg.setToAddresses(toAddress);
        msg.setSubject('Opportunity Status');
        msg.setPlainTextBody('GoodEvening sir, Opportunity Status is Changed to Closed won');
        mail.add(msg);
        messaging.sendEmail(mail);
       
    }
}