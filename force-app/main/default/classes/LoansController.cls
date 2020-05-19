public with sharing class LoansController {

    @AuraEnabled
    public static List<Loan__c> searchLoansByEmployee(String employeeId) {
        employeeId = EmployeeHelper.GetEmployeeId();
        List<Loan__c> loans = [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Employee__c =:employeeId ORDER BY LastModifiedDate DESC];
        return loans;
    }

    @AuraEnabled
    public static List<Loan__c> getReferredLoans(){
        String status = 'Referred';
        List<Loan__c> loans = [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Status__c =:status ORDER BY LastModifiedDate DESC];
        return loans;
    }

    @AuraEnabled
    public static LoanReviewDto getLoanToReview(String loanId){
        if(loanId == null) return null;

        LoanReviewDto loanReviewDto = new LoanReviewDto();
        
        Loan__c loan = [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Id =:loanId];        
        Integer userScore = CreditScoreAdapter.GetUserScoreMock(EmployeeHelper.GetEmployeeId());
        
        loanReviewDto.Loan = loan;
        loanReviewDto.UserScore = userScore;
		System.debug(loanReviewDto);        
        return loanReviewDto;
    }

    @AuraEnabled
    public static Loan__c saveLoan(Loan__c loan) {
        if(loan == null) return null;

        loan.Status__c = 'Referred';
		loan.Employee__c = EmployeeHelper.GetEmployeeId();
        insert loan;
        return loan;
    }

    @AuraEnabled
    public static Loan__c updateLoanStatus(String loanId, String status) {
        if(loanId == null || status == null) return null;

        Loan__c loan = [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Id =:loanId];
        loan.Status__c = status;
        update loan;
        return loan;
    }       
        
    @AuraEnabled
    public static String testRequest(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(System.URL.getSalesforceBaseURL().toExternalForm()+'/services/apexrest/CreditScore/'+ EmployeeHelper.GetEmployeeId());
        request.setMethod('GET');
        request.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        HttpResponse response = http.send(request);
           
        System.debug('here we go');
        if (response.getStatusCode() == 200) {
            System.debug('works!');
            Integer result = (Integer) JSON.deserializeUntyped(response.getBody());
            
            System.debug(result);
            System.debug(response.getBody());
            return response.getBody();
        }
        else{
            Integer reps = response.getStatusCode();
            
            System.debug(reps);
            System.debug(response.getBody());
            return response.getBody();
        }
    }
}