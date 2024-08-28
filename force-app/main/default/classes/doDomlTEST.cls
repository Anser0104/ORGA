@istest
public class doDomlTEST {
    public static testmethod void verifydata()
    {
        doDoml a = new doDoml();
        a.doInsert();
        a.doUpdate();
        a.doDelete();
        a.doUnDelete();
        a.bulkInsert(2);
        a.bulkInsert1(2);
        a.doUpsert();
    }
}