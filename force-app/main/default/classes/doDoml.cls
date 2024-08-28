public class doDoml {

    public void doInsert(){
        Account acc = new Account();
        acc.Name = 'test apex class record 1';
        acc.Industry = 'Banking';
        insert acc;
        system.debug('acc.Id==>'+acc.Id);
    }
    public void doUpdate(){
        Account acc = new Account();
       	acc.Id = '0015g00000PGCMLAA5';
        acc.Industry = 'Apparel';
        update acc;
    }
    public void doDelete(){
        Account acc = new Account();
        acc.Id = '0015g00000PGCM6AAP';
        delete acc;
    }
    public void doUnDelete(){
        Account acc = new Account();
        acc.Id = '0015g00000PGCM6AAP';
        unDelete acc;
    }
    public void bulkInsert(integer n){
        
        List<Students_Detail__c> stuList = new List<Students_Detail__c>();
        
        for(integer i=0; i<n; i++){
            Students_Detail__c stu = new Students_Detail__c();
            stu.Name = 'test'+i;
            stu.Mobile_number__c = '7814369551';
            stu.Student_Age__c = 20;
            stu.Account__c = '0015g00000PGCM6AAP';
            stuList.add(stu);
        }
        insert stuList;
        
    }
    public void bulkInsert1(integer n){
        
        List<Students_Detail__c> stuList = new List<Students_Detail__c>();
        
        Students_Detail__c stu = new Students_Detail__c();
        stu.Name = 'arif';
        stu.Mobile_number__c = '7814369551';
        stu.Student_Age__c = 20;
        stu.Account__c = '0015g00000PGCM6AAP';
        stuList.add(stu);
        
        Students_Detail__c stu1 = new Students_Detail__c();
        stu1.Name = 'test 123';
        stu1.Mobile_number__c = '7814369551';
        stu.Student_Age__c = 20;
        stu1.Account__c = '0015g00000PGCM6AAP';
        stuList.add(stu1);
        
        Students_Detail__c stu2 = new Students_Detail__c();
        stu2.Name = 'test 1234';
        stu2.Mobile_number__c = '7814369551';
        stu2.Student_Age__c = 20;
        stu2.Account__c = '0015g00000PGCM6AAP';
        stuList.add(stu2);
            
        insert stuList;
        
    }
    public void doUpsert(){
        Account acc = new Account();
        acc.Name = 'test apex class record 1';
        //acc.Id = '0015g00000PGCMLAA5';
        acc.Industry = 'Education';
        upsert acc;
    }
}