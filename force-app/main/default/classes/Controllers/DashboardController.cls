public with sharing class DashboardController {

    @AuraEnabled
    public static DashboardSummaryDto getDashboardSummary() {
       return DashboardRepository.getDashboardSummary();
    }    
}