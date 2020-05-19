public with sharing class CreditScoreAdapter {
    
    public static Integer GetUserScore(String userId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(System.URL.getSalesforceBaseURL().toExternalForm()+'/services/apexrest/CreditScore/'+ userId);
        request.setMethod('GET');
        request.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        HttpResponse response = http.send(request);
           
        System.debug('here we go');
        if (response.getStatusCode() == 200) {
            System.debug('yeyyy!');
            Integer result = (Integer) JSON.deserializeUntyped(response.getBody());
            
            System.debug(result);
            return result;
        }
        else{
            Integer reps = response.getStatusCode();
            
            System.debug(reps);
            System.debug(response.getBody());
            return -1;
        }
    }
}