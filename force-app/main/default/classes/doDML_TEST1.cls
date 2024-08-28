@ISTEST
public class doDML_TEST1 {
    public static testmethod void verifydata()
    {
        doDML a = new doDML();
        a.doinsert();
        a.doupdate();
        a.dodelete();
        a.doundelete();
        a.bulkinsert();
        a.bulkupdate();
    }
}