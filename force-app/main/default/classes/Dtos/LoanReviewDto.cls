public class LoanReviewDto {
    @AuraEnabled
    public Loan__c Loan {get; set;}
    @AuraEnabled
    public Integer UserScore {get; set;}
}