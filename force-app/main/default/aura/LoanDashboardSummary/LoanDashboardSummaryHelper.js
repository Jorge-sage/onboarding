({
    getSummary: function (component) {
        var action = component.get("c.getDashboardSummary");
        action.setCallback(this, function(response){
            var summaryDto = response.getReturnValue();
            component.set("v.totalAmount", summaryDto.TotalAmount);
            component.set("v.approvedLoans", summaryDto.ApprovedLoans);
            component.set("v.rejectedLoans", summaryDto.RejectedLoans);
            component.set("v.totalLoans", summaryDto.TotalLoans);
            component.set("v.referredLoans", summaryDto.ReferredLoans);
        });
        $A.enqueueAction(action);
    }
})