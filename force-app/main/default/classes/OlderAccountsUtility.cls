public class OlderAccountsUtility {
    public static void updateOlderAccounts() {
        // Get the 5 oldest accounts
        Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
        system.debug('oldAccounts'+oldAccounts);
        // loop through them and update the Description field
        for (Account acct : oldAccounts) {
            acct.Description = 'Heritage Account';
        }
        // save the change you made
        update oldAccounts;
        system.debug('oldAccounts'+oldAccounts);
    }
}