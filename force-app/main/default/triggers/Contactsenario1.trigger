trigger Contactsenario1 on Contact (after insert) {
    list<Opportunity>opplist =new list<Opportunity>();
    for(Contact con: trigger.new)
    {
        if(con.Create_Opportunity_Checkbox__c==true)
        {
            Opportunity opp =new Opportunity();
            opp.Name ='opptest1';
            opp.CloseDate =Date.newInstance(2021, 09, 11);
            opp.StageName ='Needs Analysis';
            opplist.add(opp);
        }
    }
    insert opplist;
}