public class Inser_Records_by_coding {

   public void insertmethod()
   {
      Students_Detail__c SDS = new Students_Detail__c ();
       SDS.Name = 'Test Name';
       SDS.Account__c = '0015g00000PGCM6AAP';
       SDS.Mobile_number__c ='8795661353';
       SDS.Id = 'a015g00000Ui2D8AAJ';
       SDS.Student_Age__c =20;
       update SDS;
       system.debug('students details: '+SDS);
   }
    public void display()
    {
      Account acc = new Account();
        acc.Name ='My personal Accont';
        acc.Industry ='null';
        acc.Active__c = 'no';
        insert acc;
        system.debug('my account: '+acc);
        
    }
}