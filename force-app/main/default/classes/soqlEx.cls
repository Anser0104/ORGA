public class soqlEx {

    public void soqlExample(){
        List<Account> accList = new List<Account>();
        accList = [SELECT id, name, industry from account WHERE industry ='null'];
        system.debug('accList==>'+accList);
        system.debug('accList==>'+accList.size());
        
        /*for(integer i=0; i<accList.size();i++){
            accList.get(i).name;
        }*/
        
        for(Account acc: accList){
            acc.Industry='Banking';
        }
        update accList;
    }
}