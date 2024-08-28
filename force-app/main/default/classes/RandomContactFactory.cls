public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(integer numcontacts,string lastnamecon){
        List<Contact> conlst = new List<Contact>();
        for(integer i=0; i<numcontacts; i++){
            Contact co = new Contact();
            co.FirstName = 'Test '+i;
            co.LastName = lastnamecon;
            conlst.add(co);
        }
        system.debug(conlst);
        return conlst;
    }
}