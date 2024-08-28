Public class AnimalLocator {
    Public Static String getAnimalNameById(integer id)
    {
        string strResp;
        Http http = new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200)
        {
            Map<String, Object> results =(Map<String, object>)JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animals = (Map<String, Object>)results.get('animal');
            System.debug('Received the following animals:' + animals );
            strResp = string.valueof(animals.get('name'));
            System.debug('strResp >>>>>>' + strResp );
            
        }
        return strResp; 
    }  
}