({
    onInit: function (component, event, helper) {
        helper.getReviewedLoan(component, 'a013N0000012bDtQAI');
    },

    rejectLoan : function (component, event, helper) {
        helper.updateLoan(component, 'Rejected');
    },

    approveLoan : function (component, event, helper) {
        helper.updateLoan(component, 'Approved');
    }
})