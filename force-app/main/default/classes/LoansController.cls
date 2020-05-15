public with sharing class LoansController {

    @AuraEnabled
    public static List<Loan__c> searchLoansByEmployee(String employeeId) {
        employeeId = 'a003N000001wfyVQAQ';
        List<Loan__c> loans = [SELECT Id, Name, Amount__c, Employee__c, Status__c, Months__c FROM Loan__c WHERE Employee__c =:employeeId ORDER BY LastModifiedDate DESC];
        return loans;
    }

    @AuraEnabled
    public static Loan__c saveLoan(Loan__c loan) {
        if(loan == null) return null;
        loan.Status__c = 'Pending';
		loan.Employee__c = 'a003N000001wfyVQAQ';
        insert loan;
        return loan;
    }
}