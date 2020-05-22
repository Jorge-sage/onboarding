@isTest
public class LoanValidatorTests {
    
    @isTest
    static void CheckIsNull_ExpectedException() {
        LoanValidator validator = new LoanValidator();

        try{
            validator.CheckIsNull(null);
            system.assertEquals(true, false); //force fail
        }catch(Exception e){
            system.assert(e != null);
        }
    }

    @isTest
    static void CheckIsNull_HappyCase() {
        LoanValidator validator = new LoanValidator();

        try{
            validator.CheckIsNull(new Loan__c());
            system.assertEquals(true, true);
        }catch(Exception e){
            system.assertEquals(true, false); //force fail
        }
    }

    @isTest
    static void ValidateForCreate_ExpectedAmountException() {
        LoanValidator validator = new LoanValidator();
        Loan__c loan = new Loan__c(Name='test', Amount__c = 1, Months__c=6);

        try{
            validator.ValidateForCreate(loan);
            system.assertEquals(true, false); //force fail
        }catch(Exception e){
            system.assert(e != null);
        }
    }

    @isTest
    static void ValidateForCreate_ExpectedMonthsException() {
        LoanValidator validator = new LoanValidator();
        Loan__c loan = new Loan__c(Name='test', Amount__c = 3000, Months__c=1);

        try{
            validator.ValidateForCreate(loan);
            system.assertEquals(true, false); //force fail
        }catch(Exception e){
            system.assert(e != null);
        }
    }

    @isTest
    static void ValidateForCreate_HappyCase() {
        LoanValidator validator = new LoanValidator();
        Loan__c loan = new Loan__c(Name='test', Amount__c = 3000, Months__c=12);

        try{
            validator.ValidateForCreate(loan);
            system.assertEquals(true, true); //force fail
        }catch(Exception e){
            system.assertEquals(true, false); //force fail
        }
    }
}
