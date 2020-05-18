({
    getLoansForReview: function (component, employeeId) {
        var action = component.get("c.getReferredLoans");
        action.setParams({
            employeeId: employeeId
        });
        
        action.setCallback(this, function(response){
            var loans = response.getReturnValue();
            component.set("v.loans", loans);
        });
        
        $A.enqueueAction(action);
    },
})
