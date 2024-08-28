@istest
public class UpdateStudentage_batchapex_Test {
	public static testmethod void verifydata()
    {
        Account acc = new Account();
        acc.name='dummt account';
        acc.Industry='Education';
        insert acc;
        system.debug('account id '+acc.Id);
        
        list<Students_Detail__c> insertstd = new list<Students_Detail__c>();
        Students_Detail__c sdc = new Students_Detail__c();
        sdc.Account__c =acc.Id;
        sdc.Name ='testname';
        sdc.Mobile_number__c = '7852239546';
        sdc.Student_Age__c = null;
        insertstd.add(sdc);
        insert insertstd;
        system.debug('sdc id '+sdc.id);
      
        list<Students_Detail__c> stdlist =[SELECT Id,Name,Student_Age__c FROM Students_Detail__c];
        
        test.startTest();
        UpdateStudentage_batchapex a = new UpdateStudentage_batchapex();
        database.executeBatch(a);
        test.stopTest();
    }
}