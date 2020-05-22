@isTest
private class DashboardRepositoryTests extends BaseTests{
    static String employeeId;
    static List<Loan__c> loans;
    
    @testSetup
	static void setup(){
		Employee__c employee = GenerateEmployee(5000);
		employeeId = employee.Id;

		loans = new List<Loan__c>();
		loans.add(new Loan__c(Name = 'loan_dashboard_1', Status__c = 'Rejected', Amount__c = 5000, Months__c = 6, Employee__c = employeeId));
		loans.add(new Loan__c(Name = 'loan_dashboard_2', Status__c = 'Approved', Amount__c = 5000, Months__c = 6, Employee__c = employeeId));
		loans.add(new Loan__c(Name = 'loan_dashboard_3', Status__c = 'Referred', Amount__c = 5000, Months__c = 6, Employee__c = employeeId));
		insert loans;
    }
    
    @isTest
	static void getDashboardSummary_HappyCase(){
		//Arrange
		setup();

		//Act
		DashboardSummaryDto dashboardSummaryDto = DashboardRepository.getDashboardSummary();

        //Assert
        System.assertNotEquals(null, dashboardSummaryDto);
        System.assert(dashboardSummaryDto.TotalLoans >= 3);
        System.assert(dashboardSummaryDto.TotalAmount >= 15000);
        System.assert(dashboardSummaryDto.ApprovedLoans >= 1);
        System.assert(dashboardSummaryDto.RejectedLoans >= 1);
        System.assert(dashboardSummaryDto.ReferredLoans >= 1);
	}
}
