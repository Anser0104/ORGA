public class PincodeController {
    @AuraEnabled
    public static string getPostalDetails(String pin){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.postalpincode.in/pincode/'+pin);
        system.debug('pin is '+pin);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        list<postalPincodeReponse> postalPincodeReponseList;
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string
            system.debug(response.getBody());
           	postalPincodeReponseList = postalPincodeReponse.parse(response.getBody());
            
        }
        system.debug('postalPincodeReponseList'+postalPincodeReponseList);
        return response.getBody();
        
    }
}