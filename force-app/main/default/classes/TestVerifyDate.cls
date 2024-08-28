@isTest
public class TestVerifyDate {
    @isTest static void test1CheckDates(){
       Date TEST1date = VerifyDate.CheckDates(Date.parse('01/01/2022'),Date.parse('01/03/2022'));
        system.assertEquals(Date.parse('01/03/2022'),TEST1date);
    }
    
    @isTest static void test2CheckDates(){
       Date TEST2date = VerifyDate.CheckDates(Date.parse('01/01/2022'),Date.parse('03/03/2022'));
        system.assertEquals(Date.parse('01/31/2022'),TEST2date);
    }
    
     @isTest static void test3DateWithin30Days(){
       Date TEST3date = VerifyDate.CheckDates(date.parse('03/01/2022'),Date.parse('01/03/2022'));
        system.assert((false),TEST3date);
    }
    
       @isTest static void test4DateWithin30Days(){
       Date TEST4date = VerifyDate.CheckDates(Date.parse('03/31/2022'),Date.parse('03/31/2022'));
        system.assert((false),TEST4date);
    }
                            
}