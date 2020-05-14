public with sharing class LoansController {

    @AuraEnabled
    public static Loan__c saveLoan(Loan__c loan) {
        if(loan == null) return null;
        loan.Status__c = 'Pending';
		loan.Employee__c = 'a003N000001wfyVQAQ';
        insert loan;
        return loan;
    }
}