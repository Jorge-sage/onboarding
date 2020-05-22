@RestResource(urlMapping='/CreditScore/*')
global with sharing class CreditScoreService {
    
    @HttpGet
    global static Integer GetUserScore() {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        String userId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
        Integer userScore = Integer.valueof((Math.random() * 100));
        return userScore;
    }

    public static Integer GetUserScoreMock() {
        return Integer.valueof((Math.random() * 100));
    }
}