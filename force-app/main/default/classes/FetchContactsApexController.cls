public class FetchContactsApexController {
	@AuraEnabled
    public static List<Contact> getContactList(){
         List<Contact> conlist = [select id,FirstName,LastName,CleanStatus from Contact limit 10];
        return conlist;
    }
}