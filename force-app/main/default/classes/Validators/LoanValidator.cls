public class LoanValidator {
    private String notNullAllowed = 'Loan can not be null';
    private String amountError = 'Amount must be between 1000 and 5000';
    private String monthsError = 'Period month return between 6 and 12';
    private String requiredInputs = 'Values can not be null or empty';

    public void CheckIsNull(Loan__c loan){
        if(loan == null){
            throw new ApplicationException(notNullAllowed);
        }
    }
    
    public void ValidateForCreate(Loan__c loan) {
        CheckIsNull(loan);

        if(loan.Amount__c < 1000 || loan.Amount__c > 5000){
            throw new ApplicationException(amountError);
        }

        if(loan.Months__c < 6 || loan.Months__c > 12){
            throw new ApplicationException(monthsError);
        }
    }


    public void ValidateForUpdateStatus(String loanId, String status){
        if(loanId == null || status == null || 
            String.isBlank(loanId) || String.isBlank(status) ||
            String.isEmpty(loanId) || String.isEmpty(status)){
                throw new ApplicationException(requiredInputs);
            }
    }
}
