trigger createBackUpContact on Contact (after delete) {
    
    List<contact_backup__c> cnctBackUpList = new List<contact_backup__c>();
    for(Contact cnct: trigger.old){
        contact_backup__c cnctBackUp = new contact_backup__c();  
        cnctBackUp.Name = cnct.lastName;
        cnctBackUpList.add(cnctBackUp);
        //insert cnctBackUp;
    }
    insert cnctBackUpList;
}