public class DoDmlFromAura {

    @AuraEnabled
    public static Id insertcontactRecord(string conSalutation, string conLastname)
    {
       Contact con = new Contact();
        con.AccountId = con.AccountId;
        con.Salutation = conSalutation;
        con.LastName = conLastname;
        insert con;
        Return con.Id;
    }
}