public class DynamicQueryEX {
	public void dynqry()
    {
        string newqry = 'SELECT Id,Name,Birthdate,Title FROM Contact WHERE Birthdate != NULL ';
        list < Contact > conlist = new list < Contact >();
        conlist = Database.query(newqry);
        system.debug('conlist==> '+conlist);
        system.debug('size of conlist==>'+conlist.size());
       /* FOR(Contact cont: conlist)
        {
            cont.Birthdate = Date.newInstance(20,12,2021);
        }
        update conlist;*/
    }
}