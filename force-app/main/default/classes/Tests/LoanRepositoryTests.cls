@isTest
private class LoanRepositoryTests extends BaseTests{
	static String employeeId;
	static List<Loan__c> loans;

	@testSetup
	static void setup(){
		Employee__c employee = GenerateEmployee(5000);
		employeeId = employee.Id;

		loans = new List<Loan__c>();
		loans.add(new Loan__c(Name = 'loan_1', Status__c = 'Rejected', Amount__c = 5000, Months__c = 6, Employee__c = employeeId));
		loans.add(new Loan__c(Name = 'loan_2', Status__c = 'Approved', Amount__c = 5000, Months__c = 6, Employee__c = employeeId));
		loans.add(new Loan__c(Name = 'loan_3', Status__c = 'Referred', Amount__c = 5000, Months__c = 6, Employee__c = employeeId));
		insert loans;
	}

	@isTest
	static void GetLoansByEmployeeId_HappyCase(){
		//Arrange
		setup();

		//Act
		List<Loan__c> loans = LoanRepository.GetLoansByEmployeeId(employeeId);

		//Assert
		System.assertEquals(3, loans.size());
	}

	@isTest
	static void GetLoansByStatus_StatusApproved_Then_ReturnsOne(){
		String status = 'Approved';
		GetLoanByStatus(status);
	}

	@isTest
	static void GetLoansByStatus_StatusRejected_Then_ReturnsOne(){
		String status = 'Rejected';
		GetLoanByStatus(status);
	}

	@isTest
	static void GetLoansByStatus_StatusReferred_Then_ReturnsOne(){
		String status = 'Referred';
		GetLoanByStatus(status);
	}

	@isTest
	static void GetLoanById_HappyCase(){
		//Arrange
		setup();
		String loanId = loans[0].Id;

		//Act
		Loan__c loan = LoanRepository.GetLoanById(loanId);

		//Assert
		System.assertEquals(loanId, loan.Id);
	}

	@isTest
	static void CreateLoan_HappyCase(){
		//Arrange		
		setup();
		Loan__c loan = new Loan__c(Name = 'loan_1', Status__c = 'Rejected', Amount__c = 5000, Months__c = 6, Employee__c = employeeId);

		//Act
		Loan__c createdLoan = LoanRepository.CreateLoan(loan);

		//Assert
		System.assertNotEquals(null, createdLoan);
		System.assert(String.isNotEmpty(createdLoan.Id));
		System.assertEquals('Referred', createdLoan.Status__c);
	}

	@isTest
	static void UpdateStatus_ReferredToRejected_HappyCase(){
		//Arrange		
		setup();
		Loan__c loan = new Loan__c(Name = 'loan_1', Status__c = 'Referred', Amount__c = 5000, Months__c = 6, Employee__c = employeeId);
		insert loan;

		//Act
		Loan__c updatedLoan = LoanRepository.UpdateStatus(loan.Id, 'Approved');

		//Assert
		System.assertNotEquals(null, updatedLoan);
		System.assertEquals('Approved', updatedLoan.Status__c);
	}


	private static void GetLoanByStatus(String status){
		setup();

		//Act
		List<Loan__c> loans = LoanRepository.GetLoansByStatusAndEmployee(status, employeeId);

		//Assert
        System.assertEquals(1, loans.size());
        System.assertEquals(status, loans[0].Status__c);
	}
}