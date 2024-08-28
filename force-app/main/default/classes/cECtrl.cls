public class cECtrl {
	@AuraEnabled
    public static List<Account> getAccountRecords(string accIndustry){
        return [SELECT Id, Name, Industry, Rating FROM Account WHERE industry=:accIndustry];
    }
}