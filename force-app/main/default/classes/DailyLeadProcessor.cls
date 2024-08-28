global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext sc){
        List<Lead> lesdlst =[SELECT Id From Lead WHERE LeadSource = NULL Limit 200];
        List<Lead> leadUpdatedlst = new list<Lead>();
        if(!lesdlst.isEmpty()){
            for(Lead le:lesdlst){
                le.LeadSource='Dreamforce';
                leadUpdatedlst.add(le);
            }
            update leadUpdatedlst;
        } 
    }
}