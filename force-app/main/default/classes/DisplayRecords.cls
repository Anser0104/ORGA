public class DisplayRecords{
    
    @Auraenabled
    public static List<sObject> getRecords(string objName){
        return Database.Query('SELECT Id, Name FROM '+objName +' LIMIT 10');
    }
}