global with Sharing class SalesforceCalloutService {
    @AuraEnabled
    global static String createAccountFromSource(String accountName,String accountIndustry, String targetEndpoint, String accessToken) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(targetEndpoint);
        system.debug('Target End Point :'+targetEndpoint);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer '+ accessToken);
        system.debug('Access_token:' +accessToken );
        req.setHeader('Accept','application/json');
        req.setBody('{"AccName":"' + accountName + '","AccIndustry":"' + accountIndustry + '"}');
        system.debug('accountName: '+accountName );
        system.debug('AccIndustry: '+accountIndustry );
        
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
             String results = ( String ) JSON.deserializeUntyped(res.getBody());
             return  results;
        }
        system.debug('Status code :'+res.getStatusCode());
        system.debug('Response : '+res.getBody());
        string acctID = JSON.serialize(res.getBody());
        return  acctID;
    }
}