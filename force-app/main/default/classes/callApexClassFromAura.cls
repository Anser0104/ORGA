public class callApexClassFromAura {

    @AuraEnabled
    public static String apexMethod(){
        string message ='message from apex ';
        return message;
    }
}