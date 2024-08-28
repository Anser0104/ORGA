@isTest
private class DailyLeadProcessorTest {
    @testSetup
    static void Setup(){
        list<Lead> leads = new List<Lead>();
        for(integer i=0; i<200; i++){
            Lead l =new Lead(
                FirstName ='FirstName' +i,
                LastName='LastName' +i,
                Company='The Inc',
                Leadsource = ' '
            );            
            leads.add(l); 
        }
        insert leads;
    }
        
        static testmethod void testScheduledJob(){
            string CRON_EXP='0 5 12 * * ?';
            
            Test.startTest();
            string jobId=system.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
            
            list<Lead> checkleads = new list<Lead>();
            checkleads=[SELECT Id From Lead WHERE LeadSource = NULL Limit 200];
            system.assertEquals(200, checkleads.size(),'Lead records were not created');
            Test.stopTest();   
        }   
    }