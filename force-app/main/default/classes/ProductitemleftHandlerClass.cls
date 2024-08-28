public class ProductitemleftHandlerClass 
{
    public static void ProductitemleftHandlerInsertMethod(list<Cs_Order__c> orderlist){
        list<string> prodids = new list<string>();
        for(Cs_Order__c ordlst:orderlist){
            if(ordlst.ProductItems__c !=null){
                prodids.add(ordlst.ProductItems__c);
            }
        }
        Map<id,Cs_ProductItem__c> promap =new Map<id,Cs_ProductItem__c>
  ([select id,Products_Left__c,Total_Stock__c,Total_Ordered_Units__c,(select Id, ProductItems__c, Quantity__c from Custom_Orders__r ) from Cs_ProductItem__c where Id IN:prodids]);
        for(Cs_Order__c orders: orderlist){
            if(orders.ProductItems__c != null && (orders.Order_Status__c == 'Accepted')){
               
                promap.get(orders.ProductItems__c).Products_Left__c =  promap.get(orders.ProductItems__c).Total_Stock__c -(promap.get(orders.ProductItems__c).Total_Ordered_Units__c + orders.Quantity__c);    
            }
        }
            update promap.values();
     
    }
    
        public static void ProductitemleftHandlerUpdatetMethod(list<Cs_Order__c> orderlist, map<Id, Cs_Order__c> oldOrderMap){
         list<string> prodids = new list<string>();
            for(Cs_Order__c ordlst:orderlist){
               if(ordlst.ProductItems__c !=null){
                    prodids.add(ordlst.ProductItems__c);
                        }
                }
       // Map<> prooldmap = new Map<>();
            
          Map<id,Cs_ProductItem__c> promap =new Map<id,Cs_ProductItem__c>
    ([select id,Products_Left__c,Total_Stock__c,Total_Ordered_Units__c,(select Quantity__c from Custom_Orders__r ) from Cs_ProductItem__c where id in:prodids]);   
            for(Cs_Order__c orders: orderlist){
                if(orders.ProductItems__c != null && (orders.Order_Status__c == 'Cancelled'))
                {
                promap.get(orders.ProductItems__c).Products_Left__c = promap.get(orders.ProductItems__c).Products_Left__c+orders.Quantity__c;
                } 
                
                if(orders.ProductItems__c != null && (orders.Order_Status__c == 'Accepted' && oldOrderMap.get(orders.Id).Quantity__c > orders.Quantity__c ) ){
                  
               
                promap.get(orders.ProductItems__c).Products_Left__c  = promap.get(orders.ProductItems__c).Products_Left__c +(oldOrderMap.get(orders.Id).Quantity__c-orders.Quantity__c);
                
            }
              
              if(orders.ProductItems__c != null && (orders.Order_Status__c == 'Accepted' && orders.Quantity__c > oldOrderMap.get(orders.Id).Quantity__c ) ){
                  
               
                promap.get(orders.ProductItems__c).Products_Left__c = promap.get(orders.ProductItems__c).Products_Left__c-(orders.Quantity__c - oldOrderMap.get(orders.Id).Quantity__c);
                
           		 }
                
            }
           update promap.values();
    
        }
    
    
   /*  public static void ProductitemleftHandlerUpdatetMethod1(Map<Id, Cs_Order__c> OldOrderMap)
             {
                  list<string> prodId = new list<string>();
            for(Cs_Order__c ordlst:orderlist){
               if(ordlst.ProductItems__c !=null){
                    prodId.add(ordlst.ProductItems__c);
                        }
                }
                 Map<id,Cs_ProductItem__c> promap =new Map<id,Cs_ProductItem__c>
    ([select id,Products_Left__c,Total_Stock__c,Total_Ordered_Units__c,(select Quantity__c from Custom_Orders__r ) from Cs_ProductItem__c where id in:prodId]);
                 
                 for(Cs_Order__c orders: OldProMap.values()){
                     if(orders.ProductItems__c != null && (orders.Order_Status__c == 'Accepted' && orderOldMap.get(orders.ProductItems__c).Quantity__c > orders.Quantity__c ) ){
                  
               
                orderOldMap.get(orders.ProductItems__c).Products_Left__c  = promap.get(orders.ProductItems__c).Products_Left__c+(orderOldMap.get(orders.ProductItems__c).Quantity__c-orders.Quantity__c);
                
            }
              
              if(orders.ProductItems__c != null && (orders.Order_Status__c == 'Accepted' && orderOldMap.get(orders.ProductItems__c).Quantity__c < orders.Quantity__c ) ){
                  
               
                promap.get(orders.ProductItems__c).Products_Left__c= promap.get(orders.ProductItems__c).Products_Left__c-(orderOldMap.get(orders.ProductItems__c).Quantity__c-orders.Quantity__c);
                
            }
                 }
             }
     	update orderOldMap();*/
}