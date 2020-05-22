public class LoanRepository {
    public static List<Loan__c> GetLoansByEmployeeId(String employeeId) {
        return [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Employee__c =:employeeId ORDER BY LastModifiedDate DESC];
    }

    public static List<Loan__c> GetLoansByStatus(String status) {
        return [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Status__c =:status ORDER BY LastModifiedDate DESC];
    }

    public static List<Loan__c> GetLoansByStatusAndEmployee(String status, String employeeId) {
        return [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Status__c =:status AND Employee__c =:employeeId ORDER BY LastModifiedDate DESC];
    }

    public static Loan__c GetLoanById(String loanId) {
        return [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Id =:loanId];
    }

    public static Loan__c CreateLoan(Loan__c loan) {
        loan.Status__c = 'Referred';
        if(String.isBlank(loan.Employee__c) ||String.isEmpty(loan.Employee__c))
        	loan.Employee__c = EmployeeHelper.GetEmployeeId();
        insert loan;
        return loan;
    }

    public static Loan__c UpdateStatus(String loanId, String status) {
        Loan__c loan = GetLoanById(loanId);
        loan.Status__c = status;
        update loan;
        return loan;
    }
}