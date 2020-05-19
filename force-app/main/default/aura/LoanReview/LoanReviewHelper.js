({
    getReviewedLoan: function (component, loanId) {
         var action = component.get("c.getLoanToReview");
         action.setParams({
             loanId: loanId
         });
        
         action.setCallback(this, function(response){
             var loan = response.getReturnValue();
             debugger;
             
             component.set("v.userScore", loan.UserScore);
             component.set("v.loanId", loanId);
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
        
        var loanId = component.get('v.loanId');
        this.sendUpdateRequest(component, loanId, status, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.loanToReview", {});
                component.set("v.successResponse", true);
                component.set("v.errorResponse", false);
                this.fireReviewedEvent(component, loanId);
            }
            else{
                component.set("v.successResponse", false);
                component.set("v.errorResponse", true);
            }
        });
    },

    fireReviewedEvent: function (component, id) {
        var applicationEvent = $A.get("e.c:LoanReviewedEvent");
        applicationEvent.setParams({ "id": id });   
        applicationEvent.fire();
    }
})