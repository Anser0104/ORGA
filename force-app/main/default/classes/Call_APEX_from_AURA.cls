public class Call_APEX_from_AURA {

    @AuraEnabled
    public static string messagefromAuraMethod()
    {
        string message = 'message from apex/server';
        return message;
        
    }
}