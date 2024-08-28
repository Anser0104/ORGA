public class ListExample {
    public void diplay()
    {
        list < integer > numberlist = new list < integer > ();
        numberlist.add(1);
        numberlist.add(2);
        numberlist.add(8);
        numberlist.add(6);
        numberlist.add(7);
         system.debug('numbers list is ' +numberlist);
        system.debug('numbers list size is ' +numberlist.size());
         numberlist.remove(4);
         system.debug('numbers list after remove ' +numberlist);
        numberlist.add(10);
        numberlist.add(20);
        numberlist.add(780);
        system.debug('numbers list is ' +numberlist);
        system.debug('numbers list size is ' +numberlist.size());
        numberlist.remove(0);
        system.debug('numbers list is after remove ' +numberlist);
         numberlist.add(0,1);
         system.debug('numbers list is after add 1 ' +numberlist);
        numberlist.sort();
        system.debug('numbers list is after sorting list ' +numberlist);
        numberlist.clear();
        system.debug('numbers list is after clear ' +numberlist);
        numberlist.add(8);
        numberlist.add(4);
        numberlist.add(5);
        numberlist.add(6);
        numberlist.add(7);
        numberlist.add(1);
        numberlist.add(2);
        numberlist.add(3);
        numberlist.add(9);
        numberlist.add(10);
        system.debug('numbers list is after adding elements ' +numberlist);
        numberlist.sort();
        system.debug('numbers list is after sorting list ' +numberlist);
        system.debug('numbers list is contains 12 ' +numberlist.contains(12));
         system.debug('numbers list is contains 6 ' +numberlist.contains(6));
        list < integer > numberlist2 = new list < integer > ();
        system.debug('numbers list2 ' +numberlist2);
        numberlist2.addall(numberlist);
        system.debug('numbers list2 after addall elements from list1' +numberlist2);
       
        system.debug('numberlist2 after get element '+numberlist2.get(5));
        numberlist.add(6,11);
        system.debug('numberlist2 after add element '+numberlist);
       /*numberlist.add('ansar');
        numberlist.add('basha');
        numberlist.add('kishore');
        numberlist.add('ranga');
        numberlist.add('khadeer');
        numberlist.add('Athaullah');
        system.debug('list1 '+numberlist);
        */
		numberlist.add(11);
		 system.debug('numberlist2 after add element '+numberlist);
        system.debug('numberlist size '+numberlist.size());
        system.debug('numberlist2 after get element index 10 '+numberlist.get(10));
        system.debug('numberlist2 after get element index 11 '+numberlist.get(11));
        system.debug('numberlist2 after get element index 9 '+numberlist.get(9));
        system.debug('numberlist2 after get element index 5 '+numberlist.get(5));
        system.debug('numberlist2 after get element index 6 '+numberlist.get(6));
        
        
    }
    public void setexample()
    {
        set  < integer > setlist = new set < integer >();
    	setlist.add(12);
        setlist.add(13);
        setlist.add(14);
        setlist.add(15);
        setlist.add(16);
        system.debug('setlist : '+setlist);
     
        

        
    }
    
    
}