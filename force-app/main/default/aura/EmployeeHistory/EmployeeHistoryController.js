({
    onInit: function (component, event, helper) {
        helper.getLoansByEmployee(component);
    },
    
    handleLoanCreated: function(component, event, helper){
        helper.getLoansByEmployee(component);
    }
})