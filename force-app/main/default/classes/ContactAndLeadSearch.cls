public class ContactAndLeadSearch {
   
    public static List<List<sObject>> searchContactsAndLeads(string sSearchParameter){
     List<List<sObject>> searchList = [FIND 'Smith' IN ALL FIELDS RETURNING Contact(lastName), Lead(LastName) ];
     Contact[] searchcontacts =(Contact[])searchList[0];
     Lead[] searchleads = (Lead[])searchList[1];
        
        system.debug('Found the following Contacts');
        for(Contact cnt: searchcontacts){
            system.debug(cnt.LastName);
        }
        system.debug('Found the following Leads.');
        for(Lead lea:searchleads){
            system.debug(lea.LastName);
        }
        
        return searchList;
    }
}