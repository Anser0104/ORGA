@istest
public class doDML_test {
	 public static testmethod void testdoDML()
     {
          Account acc = new Account();
        acc.Name = 'Test acctt1';
        acc.Industry ='Biotechnology';
        insert acc;
		system.debug('ID AFTER UPDATE: '+acc.Id);
         Account acc1 = new Account();
        acc1.Name = 'Test acctt1';
		 delete acc1;
        system.debug('ID AFTER UPDATE: '+acc1.Id);

         
         doDML a = new doDML();
         a.doinsert();
         a.doupdate();
         a.dodelete();
         a.doundelete();
         a.bulkinsert();
         a.bulkupdate();
         
     }

}