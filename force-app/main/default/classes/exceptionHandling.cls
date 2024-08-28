public class exceptionHandling {

    public void checkEx(){
        College__c clg = new College__c();
        clg.Name = 'test';
        clg.University__c = 'a045g000003NsPnAAK';
        clg.No_of_Students__c = '344';
        
        try{
             insert clg;
        }
        catch(exception ex){
            system.debug('error is '+ex.getMessage());
        }
        finally{
            account acc = new account();
            acc.name = 'test 26th aug 2021';
            acc.Industry = 'Education';
            insert acc;
        }
    }
}