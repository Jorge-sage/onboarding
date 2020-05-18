public class DashboardRepository {	 
        
    public static DashboardSummaryDto getDashboardSummary(){
        String approvedValue = 'Approved';
        String rejectedValue = 'Rejected';
        String referredValue = 'Referred';
        DashboardSummaryDto summaryDto = new DashboardSummaryDto();
        
        summaryDto.TotalLoans = database.countQuery('select count() from Loan__c');
        
        AggregateResult ar = [SELECT SUM(Amount__c) amount from Loan__c];
        summaryDto.TotalAmount = (Double)ar.get('amount');
        
        summaryDto.ApprovedLoans = database.countQuery('SELECT COUNT() from Loan__c where Status__c =:approvedValue');
        summaryDto.RejectedLoans = database.countQuery('SELECT COUNT() from Loan__c where Status__c =:rejectedValue');
        summaryDto.ReferredLoans = database.countQuery('SELECT COUNT() from Loan__c where Status__c =:referredValue');
        
        return summaryDto;
    }
}