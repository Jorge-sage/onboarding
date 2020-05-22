({
    getLoansByEmployee: function (component) {
        var action = component.get("c.searchLoansByEmployee");
        
        action.setCallback(this, function(response){
            var loans = response.getReturnValue();
            component.set("v.loans", loans);
        });
        
        $A.enqueueAction(action);
    },
})