public with sharing class EmployeeHelper {
    public static String GetEmployeeId() {
        return [SELECT Id FROM Employee__c ORDER BY CreatedDate ASC LIMIT 1][0].Id;
    }
}