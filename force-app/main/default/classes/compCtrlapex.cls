public class compCtrlapex {

    @AuraEnabled
    public static list<Account> retunAccountRecords(string accName)
    {
        string str = '%'+accName+'%';
     return[SELECT Id, Name,Industry,Rating FROM Account WHERE Name Like : str];   
    }
}