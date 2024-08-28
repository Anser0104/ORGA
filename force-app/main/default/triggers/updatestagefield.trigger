trigger updatestagefield on Opportunity (before insert, before update) 
{
        for(Opportunity opp:trigger.new)
        {
            opp.StageName='Closed Won';
        }     
}