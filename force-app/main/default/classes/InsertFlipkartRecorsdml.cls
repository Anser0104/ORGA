public class InsertFlipkartRecorsdml {
    public static void doinsertRecords(){
        list<Flipkart__c> fliplist =new list<Flipkart__c>();
        for(integer i=1;i<=20;i++){
          Flipkart__c flip =new Flipkart__c();
          flip.Name = 'Item Name '+i;
          fliplist.add(flip);
        }
         insert fliplist;
        
    }
}