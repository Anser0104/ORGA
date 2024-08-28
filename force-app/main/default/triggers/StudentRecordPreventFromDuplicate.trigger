trigger StudentRecordPreventFromDuplicate on Students_Detail__c (before insert, before update) {
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        set<String> stdName = new set<String>();
        for(Students_Detail__c stdls:trigger.new){
            stdName.add(stdls.Name);
        }        
        if(stdName.size()>0){
            List<Students_Detail__c> stdcmplist = [Select id, Name from Students_Detail__c where Name IN:stdName];
            Map<String, Students_Detail__c> studMap = new Map<String, Students_Detail__c>();
            for(Students_Detail__c sd:stdcmplist){
                studMap.put(sd.Name, sd);
            }            
            for(Students_Detail__c students:trigger.new){
                if(studMap.containskey(students.Name)){
                    students.Name.addError('Student Name already Exist..!');
                }   
            }
        }        
    }
}