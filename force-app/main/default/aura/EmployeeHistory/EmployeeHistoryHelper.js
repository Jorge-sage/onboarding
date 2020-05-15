({
    getLoansByEmployee: function (component, employeeId) {
        var action = component.get("c.searchLoansByEmployee");
        action.setParams({
            employeeId: employeeId
        });
        
        action.setCallback(this, function(response){
            debugger;
            var loans = response.getReturnValue();
            component.set("v.loans", loans);
        });
        
        $A.enqueueAction(action);
    },
})