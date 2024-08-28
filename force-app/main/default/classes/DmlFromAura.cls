public class DmlFromAura {

    @AuraEnabled
    public static Id insertAccountRecord(string accName, string accIndustry){
        Account acc = new Account();
        acc.Name = accName;
        acc.Industry = accIndustry;
        
        insert acc;
        return acc.Id;
    }
}