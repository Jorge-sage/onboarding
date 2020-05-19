({
    onInit: function (component, event, helper) {
        helper.getLoansForReview(component, 'employeeId');
    },

    handleReviewedLoan: function (component, event, helper) {
        helper.getLoansForReview(component, 'employeeId');
    },
})