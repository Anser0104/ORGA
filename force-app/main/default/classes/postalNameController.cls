public class postalNameController {
 @AuraEnabled
    public static  String getPostalName(String postalbranchName){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.postalpincode.in/postoffice/'+postalbranchName);
         system.debug('Branch Name is '+postalbranchName);
        request.setMethod('GET');
        HttpResponse response = Http.send(request);
        
        list<postalBranchNames> postalBranchNamesList;
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
            postalBranchNamesList = postalBranchNames.parse(response.getBody());
        }
        system.debug('postalBranchNamesList :' +postalBranchNamesList);
        return response.getBody();
    }
}