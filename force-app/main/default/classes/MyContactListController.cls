public class MyContactListController {

    @AuraEnabled
    public static list<Contact> getContacts(Id recordId){
        return [SELECT Id, FirstName,LastName,Phone,Email FROM Contact WHERE AccountId = :recordId];
    }
}