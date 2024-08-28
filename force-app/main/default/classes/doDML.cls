public class doDML {
	PUBLIC void doinsert()
    {
        Account acc = new Account();
        acc.Name = 'Test acctt1';
        acc.Industry ='Biotechnology';
        insert acc;
        system.debug('id of record: '+acc.Id);
    }
    public void doupdate()
    {
        Account acc = new Account();
        acc.Name=('Test acctt1');
        acc.Industry = 'Consulting';
        acc.Id = '0015g00000R6uTnAAJ';
        update acc;
        //system.debug('ID AFTER UPDATE: '+acc.Id);
            
    }
    public void dodelete()
    {
        Account acc = new Account();
        acc.Id='0015g00000PGjKwAAL';
        delete  acc;
    }
    public void doundelete()
    {
        Account acc = new Account();
        acc.Id='0015g00000PGjKwAAL';
        undelete  acc;
    }
    public void bulkinsert()
    {
        list <Teacher__c> teacherslist = new list <Teacher__c>();
      
            Teacher__c tech = new Teacher__c();
            tech.Name = 'yadav sir';
            tech.No_of_subjects__c = 2;
            tech.Subject__c = 'a0D5g000000k55hEAA';
            teacherslist.add(tech);
         
        
        	Teacher__c tech1 = new Teacher__c();
            tech1.Name = 'Mahesh sir';
            tech1.No_of_subjects__c = 1;
            tech1.Subject__c = 'a0D5g000002kGlcEAE';
            teacherslist.add(tech1);
           
       		
        	Teacher__c tech2 = new Teacher__c();
            tech2.Name = 'Nagaraj sir';
            tech2.No_of_subjects__c = 3;
            tech2.Subject__c = 'a0D5g000002kGlhEAE';
            teacherslist.add(tech2);
       
            insert teacherslist;
       
    }
    
    public void bulkupdate()
    {
       
      
            Teacher__c tech = new Teacher__c();
            tech.No_of_subjects__c = 0;
            //tech.Subject__c = 'a0D5g000002kGlhEAE';
        	tech.Id ='a0C5g000000JVYdEAO';
         
       		update tech;
        
            Teacher__c tech1 = new Teacher__c();
            tech1.No_of_subjects__c = 2;
        	tech1.Id ='a0C5g000000JVYeEAO';
           // tech1.Subject__c = 'a0D5g000002kGlcEAE';
           
        	update tech1;
        
        	Teacher__c tech2 = new Teacher__c();
            tech2.No_of_subjects__c = 3;
       	    tech2.Id ='a0C5g000000JVYfEAO';
            //tech2.Subject__c = 'a0D5g000000k55hEAA';
           
        	update tech2;

        	Teacher__c tech3 = new Teacher__c();
            tech3.No_of_subjects__c = 1;
           // tech3.Subject__c = 'a0D5g000002kGlhEAE';
        	tech3.Id ='a0C5g000000JVYgEAO';
          
            update tech3;
        
            Teacher__c tech4 = new Teacher__c();
            tech4.Id='a0C5g000000JVZCEA4';
            tech4.No_of_subjects__c=0;
            update tech4;
        
    
    }   
}