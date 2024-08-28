@IsTest
public class DeletePastRealtedCONRecordsTest {
    
	@IsTest
    public static void testMethodToDelete() 
    {
         
       List<Contact> lstContact = new List<Contact>();
        
            Account acc = new Account();
            acc.Name ='Test Name@1';
         
        insert acc;
        
            Contact con = new Contact();
            con.LastName ='CON Name 1';
            con.Weekday_Name__c = 'Sunday';
            con.Effective_Date__c = date.newInstance(2022, 12, 11);
            con.AccountId = acc.Id;
            lstContact.add(con);
        
         Contact con1 = new Contact();
            con1.LastName ='CON Name 2';
            con1.Weekday_Name__c = 'Sunday';
            con1.Effective_Date__c = Date.newInstance(2022, 9, 05);
            con1.AccountId = acc.Id;
            lstContact.add(con1);
        
         Contact con2 = new Contact();
            con2.LastName ='CON Name 3';
            con2.Weekday_Name__c = 'Sunday';
            con2.Effective_Date__c = Date.newInstance(2022, 5, 05);
            con2.AccountId = acc.Id;
            lstContact.add(con2);
        
        Contact con3 = new Contact();
            con3.LastName ='CON Name 4';
            con3.Weekday_Name__c = 'Sunday';
            con3.Effective_Date__c = Date.newInstance(2022, 11, 05);
            con3.AccountId = acc.Id;
            lstContact.add(con3);
               
        
        insert lstContact;
         
        
        Test.startTest();
       
       /* Map<String,List<Contact>> hrsMap = new Map<String,List<Contact>>();
        List<Contact> ListToDelete = new List<Contact>();
        for(Contact hrs : lstContact){
            
            List<Contact> tempList = new List<Contact>();
            if(hrsMap.containsKey(hrs.AccountId+'@@'+hrs.Weekday_Name__c)){
                
                tempList = hrsMap.get(hrs.AccountId+'@@'+hrs.Weekday_Name__c);
                tempList.add(hrs);
            }            
            
            hrsMap.put(hrs.AccountId+'@@'+hrs.Weekday_Name__c,tempList);
                
        }
        for( List<Contact> OPHlist: hrsMap.values()){
            ListToDelete.addALL(OPHlist);
        }
        Delete ListToDelete;*/
        
            DeletePastRealtedCONRecords obj = new DeletePastRealtedCONRecords();
            DataBase.executeBatch(obj,200); 
        Test.stopTest();
    }
}