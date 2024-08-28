@istest
public class dynamicSoql_TEST {
	public static testmethod void verifydata()
    {
        dynamicSoql a = new dynamicSoql();
        a.dynamicEx('Id, Name', 'Account');
    }
}