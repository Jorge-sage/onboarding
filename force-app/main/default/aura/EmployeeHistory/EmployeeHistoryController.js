({
    onInit: function (component, event, helper) {
        helper.getLoansByEmployee(component, 'fakeId');
    },
    
    handleLoanCreated: function(component, event, helper){
        helper.getLoansByEmployee(component, 'fakeId');
    }
})