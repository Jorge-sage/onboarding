({
    getLoansByEmployee: function (component, employeeId, callback) {
        var action = component.get("c.searchLoansByEmployee");
        action.setParams({
            employeeId: employeeId
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    }
})