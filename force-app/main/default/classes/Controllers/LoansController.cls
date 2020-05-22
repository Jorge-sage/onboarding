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
        LoanValidator validator = new LoanValidator();
        validator.ValidateForCreate(loan);

        return LoanRepository.CreateLoan(loan);   
    }

    @AuraEnabled
    public static Loan__c updateLoanStatus(String loanId, String status) {
        LoanValidator validator = new LoanValidator();
        validator.ValidateForUpdateStatus(loanId, status);
        
        return LoanRepository.UpdateStatus(loanId, status);
    }
}