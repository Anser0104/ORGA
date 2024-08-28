trigger AccountSenario1 on Account (before update) {
    for(Account acc: trigger.new)
    {
        if(trigger.oldmap.get(acc.Id).Industry=='Banking' && acc.Industry=='Education')
        {
            acc.Comparing_Checkbox__c = true;
        }
    }
}