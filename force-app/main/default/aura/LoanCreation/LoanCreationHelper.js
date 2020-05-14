({
    createLoan: function (component, loan, callback) {
        var action = component.get("c.saveLoan");
        action.setParams({
            loan: loan
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    
    isValidForm: function (component, formName) {
        return component.find(formName).reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
    }
})