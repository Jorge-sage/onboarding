public class DashboardSummaryDto{
        @AuraEnabled
        public Integer TotalLoans {get; set;}
        @AuraEnabled
        public Double TotalAmount {get; set;}
        @AuraEnabled
        public Integer ApprovedLoans {get; set;}
        @AuraEnabled
        public Integer RejectedLoans {get; set;}
        @AuraEnabled
        public Integer ReferredLoans {get; set;}
    }