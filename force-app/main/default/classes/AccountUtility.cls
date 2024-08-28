public class AccountUtility {
    public static void viewAnnualRevenue(){
        list<Account> accountsList = new list<Account>();
        	accountsList = [SELECT Name,AnnualRevenue FROM Account];
        for(Account acc: accountsList){
            String acctRev = acc.Name + ':' + acc.AnnualRevenue;
            system.debug('acctRev :' +acctRev);
        }
    }
}