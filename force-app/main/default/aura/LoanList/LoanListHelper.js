({
    setupTable: function (component) {
         var actions = [
            { label: 'Edit', name: 'edit' }
        ];
        
        var cols = [
            {
                'label': 'Name',
                'fieldName': 'Name',
                'type': 'text'
            },
            {
                'label': 'Status',
                'fieldName': 'Status__c',
                'type': 'text'
            },
            {
                'label': 'Amount',
                'fieldName': 'Amount__c',
                'type': 'currency'
            },
            {
                'label': 'Month',
                'fieldName': 'Months__c',
                'type': 'number'
            }            
        ];
                
        var showActionColumn = component.get('v.editOption');
        if(showActionColumn){
            var actionColumn = { type: 'action', typeAttributes: { rowActions: actions, menuAlignment: 'left' } };        
            cols.push(actionColumn);
        }

        component.set('v.cols', cols);
        component.set('v.rows', component.get('v.loanList'));
    },

    fireEditEvent: function (component, id) {
        var applicationEvent = $A.get("e.c:LoanEditEvent");
        applicationEvent.setParams({ "id": id });   
        applicationEvent.fire();
    }
})