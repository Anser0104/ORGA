trigger AvoidDuplicates on Students_Detail__c (before insert) {
    for(Students_Detail__c s:trigger.new){
        for(Students_Detail__c s1:[SELECT Id,name FROM Students_Detail__c]){
            if(s.name==s1.name){
                s.Name.addError('This Already Exist!!!');
            }
        }
    }
}