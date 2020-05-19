({
    loanListChanged: function (component, event, helper) {
       helper.setupTable(component);
    },
     handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        helper.fireEditEvent(component, row.Id)
     }
})