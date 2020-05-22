public with sharing class CreditScoreAdapter {
    @AuraEnabled
    public static Integer GetUserScore(String userId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(System.URL.getSalesforceBaseURL().toExternalForm()+'/services/apexrest/CreditScore/'+ userId);
        request.setMethod('GET');
        request.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        HttpResponse response = http.send(request);
           
        if (response.getStatusCode() == 200) {
            Integer result = (Integer) JSON.deserializeUntyped(response.getBody());            
            return result;
        }
        else{
            System.debug(response.getBody());
            return -1;
        }
    }

    /*
    Onboarding exercise required an http call(above method), despite this was not possible to
    connect apex aura controller to a restclass apex related to validation Issues. That's why
    this method is used.
    */
    public static Integer GetUserScoreMock(String userId) {        
        return CreditScoreService.GetUserScoreMock();
    }
}