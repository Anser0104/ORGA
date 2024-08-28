public class postalBranchNames {
    public class PostalBranchName {
        @AuraEnabled public String Message{set;get;}
        @AuraEnabled public String Status{set;get;}
        @AuraEnabled public List<PostOffice> PostOffice{set;get;}
    }
    
    public class PostOffice {
        @AuraEnabled public String Name{set;get;}
        @AuraEnabled public Object Description{set;get;}
        @AuraEnabled public String BranchType{set;get;}
        @AuraEnabled public String DeliveryStatus{set;get;}
        @AuraEnabled public String Circle{set;get;}
        @AuraEnabled public String District{set;get;}
        @AuraEnabled public String Division{set;get;}
        @AuraEnabled public String Region{set;get;}
        @AuraEnabled public String State{set;get;}
        @AuraEnabled public String Country{set;get;}
        @AuraEnabled public String Pincode{set;get;}
    }
    
    
    public static List<postalBranchNames> parse(String json) {
        return (List<postalBranchNames>) System.JSON.deserialize(json, List<postalBranchNames>.class);
    }
}