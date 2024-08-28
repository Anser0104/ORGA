public class Set_Example {
	public void display()
    {
        set < string > namesset1 = new set < string > ();
       	namesset1.add('ansar');
        namesset1.add('sohail');
        namesset1.add('ismail');
        namesset1.add('kishore');
        namesset1.add('athaullah');
        system.debug('namesset1 : '+namesset1);
        namesset1.add('noor');
        system.debug('namesset1 after noor added  : '+namesset1);
        
        namesset1.add('gurrapa');
        system.debug('namesset1 after gurrapa added  : '+namesset1);
        system.debug('namesset1 SIZE  : '+namesset1.size());
        system.debug('namesset1 contains  : '+namesset1.contains('noorbasha'));
       	
       
        
    }
    public void display1()
    {
        list < integer > namelist = new list < integer >();
        namelist.add(111);
        namelist.add(222);
        namelist.add(333);
        namelist.add(444);
        system.debug('namelist : ' +namelist);
        namelist.add(0,555);
        system.debug('namelist after adding  : ' +namelist);
        
        system.debug('namelist after getting value : ' +namelist.get(3));
    }
}