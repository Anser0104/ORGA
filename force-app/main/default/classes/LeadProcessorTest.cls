@istest
private  class LeadProcessorTest {
    
        static testMethod void tetslead(){
        List<Lead> l= new List<Lead>();
            for(integer i=1; i<=200;i++){
                lead l1= new Lead();
                    l1.LastName='surya';
                    l1.Company='Company';
                    l1.Status='Closed-Converted';
                    l1.LeadSource='Dreamforce';
                    l.add(l1);
            }
        
        insert l;
   
           Test.startTest();
            LeadProcessor obj = new LeadProcessor();
            Database.executeBatch(obj);
            Test.stopTest();
      
      }       
}