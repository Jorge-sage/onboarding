public with sharing class LoansController {

    @AuraEnabled
    public static List<Loan__c> searchLoansByEmployee(String employeeId) {
        employeeId = EmployeeHelper.GetEmployeeId();
        List<Loan__c> loans = LoanRepository.GetLoansByEmployeeId(employeeId);
        return loans;
    }

    @AuraEnabled
    public static List<Loan__c> getReferredLoans(){
        String status = 'Referred';
        List<Loan__c> loans = LoanRepository.GetLoansByStatus(status);
        return loans;
    }

    @AuraEnabled
    public static LoanReviewDto getLoanToReview(String loanId){
        if(loanId == null) return null;

        LoanReviewDto loanReviewDto = new LoanReviewDto();
        
        Loan__c loan = LoanRepository.GetLoanById(loanId);   
        Integer userScore = CreditScoreAdapter.GetUserScoreMock(EmployeeHelper.GetEmployeeId());
        
        loanReviewDto.Loan = loan;
        loanReviewDto.UserScore = userScore;    
        return loanReviewDto;
    }

    @AuraEnabled
    public static Loan__c saveLoan(Loan__c loan) {
        if(loan == null) return null;

        return LoanRepository.CreateLoan(loan);   
    }

    @AuraEnabled
    public static Loan__c updateLoanStatus(String loanId, String status) {
        if(loanId == null || status == null) return null;
        
        return LoanRepository.UpdateStatus(loanId, status);
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