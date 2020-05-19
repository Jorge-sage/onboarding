({
    getLoansForReview: function (component) {
        var action = component.get("c.getReferredLoans");
        
        action.setCallback(this, function(response){
            var loans = response.getReturnValue();
            component.set("v.loans", loans);
        });
        
        $A.enqueueAction(action);
    },
})