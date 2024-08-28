public class dynamicSoql {
    
    public void dynamicEx(string fields, string obj)
    {
        string qryStr = 'SELECT '+fields +' FROM '+obj;
        
        List <sobject> objList = new List <sobject>();
        objList = database.query(qryStr);
        system.debug('objList==>'+objList);
        system.debug('objList==>'+objList.size());
    }
}