({
    onInit: function (component, event, helper) {
        helper.getLoansByEmployee(component, 'employeeId', function(response){
            var loans = response.getReturnValue();
            component.set("v.loans", loans);
        });
    }
})