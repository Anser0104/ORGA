public class AccountCreatedFromSource {
    public class deserializeResponse{
        public string Id{get; set;}
        public string access_token{get; set;}
    }
    @AuraEnabled
    public Static void createAccountinTargetOrg(String accName, String accIndustry){
        string clientId     = '3MVG9pRzvMkjMb6kda_Hm8GynvfGs3KrKrc0pdMRhpwI93nrIX8PIv05WvEb699z.iTa9Adp3jgEPe0U8fK1s';
        string clientSecret = 'D57794FF96529839FA8D1C7B98BAD8ACAB5D0E7D77CE96A6B0192B49005AFD5F';
        string username = 'nossam@TCS.com.basha';
        string password = 'SfdcDev2#*';
        string reqbody  = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        
        Http h1 = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint('https://tcscombasha-dev-ed.develop.my.salesforce.com/services/oauth2/token');
        
        HttpResponse res = h1.send(req);
        system.debug('Response :' +res);
        
        deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.Class);
        system.debug('@@@@access_token@@'+resp1 );
    
        if(resp1.access_token != null){            
            String endPoint = 'https://tcscombasha-dev-ed.develop.my.salesforce.com/services/apexrest/createAccount';
            string jsonstr = '{"AccName":"'+accName+'","AccIndustry":"'+accIndustry+'"}';
            system.debug('jsonstr :' +jsonstr);
            
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer' + resp1.access_token);
            req1.setHeader('Content-type','application/json');
            req1.setHeader('Accept','application/json');
            req1.setBody(jsonstr);
            req1.setMethod('POST');
            req1.setEndpoint(endPoint);
            
            HttpResponse res1 = h2.send(req1);
            system.debug('Response Code :' +res1.getStatusCode());
            system.debug('Response :' +res1.getbody()); 
            String objID = JSON.serialize(res1.getBody());   
          //  return objID;          
        }
    } 
}