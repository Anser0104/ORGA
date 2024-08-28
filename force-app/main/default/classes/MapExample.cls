public class MapExample {
	public void mapmethod()
    {
        map < integer,string > mapname = new map < integer,string > ();
       
        mapname.put(6,'ranga');
        mapname.put(2,'Sohail');
        mapname.put(8,'kishore');
        mapname.put(7,'Ansar');
        mapname.put(9,'basha');
        system.debug('mapnames : '+mapname);
        system.debug('keyset method : '+mapname.values());
        system.debug('keyset method : '+mapname.keyset());
        system.debug('keyset method : '+mapname.containskey(7));
      	system.debug('keyset method : '+mapname.get(8));
        system.debug('keyset method : '+mapname.size());
    }
    //put
    //get
    //keyset
    //values
    //containkey
}