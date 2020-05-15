({
    createLoan: function (component, event, helper) {
        component.set("v.successResponse", false);
        component.set("v.errorResponse", false);
        
        if (!helper.isValidForm(component, 'loanform')) return;

        var loan = component.get('v.newLoan');
        console.log("loan creation: " + JSON.stringify(loan));
        helper.createLoan(component, loan, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.newLoan", {});
                component.set("v.successResponse", true);
                component.set("v.errorResponse", false);
                helper.fireCreationEvent(component, loan);
            }
            else{
                component.set("v.successResponse", false);
                component.set("v.errorResponse", true);
            }
        });
    }
})