({
    onInit: function (component, event, helper) {
        helper.getLoansByEmployee(component, 'employeeId');
    },
    
    handleLoanCreated: function(component, event, helper){
        helper.getLoansByEmployee(component, 'employeeId');
    }
})