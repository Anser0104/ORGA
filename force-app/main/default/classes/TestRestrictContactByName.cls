@isTest
public class TestRestrictContactByName {
    @isTest static void testRestrictContactByName(){
        Contact con =new Contact ();
        con.LastName='INVALIDNAME';
        insert con;
    }
}