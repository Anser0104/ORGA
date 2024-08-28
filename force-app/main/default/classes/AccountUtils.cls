public class AccountUtils {
    public static List<Account> accountsByState(String BState){
      List<Account> accList = [select Id,Name,BillingState FROM Account where BillingState =: BState];
        return accList;
    }
}