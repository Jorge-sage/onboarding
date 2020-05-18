({
    getReviewedLoan: function (component, loanId) {
        var action = component.get("c.getLoanToReview");
        action.setParams({
            loanId: loanId
        });
        
        action.setCallback(this, function(response){
            var loan = response.getReturnValue();
            component.set("v.loanToReview", loan);
            component.set("v.loaded", true);
        });
        
        $A.enqueueAction(action);
    },

    sendUpdateRequest: function (component, loanId, status, callback) {
        var action = component.get("c.updateLoanStatus");
        action.setParams({
            loanId: loanId,
            status: status
        });
        
        action.setCallback(this, callback);
        
        $A.enqueueAction(action);
    },

    updateLoan: function (component, status) {
        component.set("v.successResponse", false);
        component.set("v.errorResponse", false);
        
        var loan = component.get('v.loanToReview');
        this.sendUpdateRequest(component, loan.Id, status, function(response){
            var state = response.getState();
            debugger;
            if (state === "SUCCESS") {
                component.set("v.loanToReview", {});
                component.set("v.successResponse", true);
                component.set("v.errorResponse", false);
                // helper.fireCreationEvent(component, loan);
            }
            else{
                component.set("v.successResponse", false);
                component.set("v.errorResponse", true);
            }
        });
    },
})