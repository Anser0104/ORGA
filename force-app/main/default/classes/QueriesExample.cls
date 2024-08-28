public class QueriesExample {
	public void soqlEX()
    {
        list<Contact> Contactlist = new list <Contact>();
        Contactlist = [SELECT id,Name,AccountId FROM Contact WHERE AccountId=''];
        system.debug('Contactlist==> '+Contactlist);
        system.debug('Contactlist==> '+Contactlist.size());
        for(Contact cont: Contactlist){
            cont.AccountId ='0015g00000HZZ88AAH';
        }
        update Contactlist;
    }
}