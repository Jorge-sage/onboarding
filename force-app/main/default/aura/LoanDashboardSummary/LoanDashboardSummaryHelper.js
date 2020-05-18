({
    getSummary: function (component, callback) {
        var action = component.get("c.getDashboardSummary");
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    }
})