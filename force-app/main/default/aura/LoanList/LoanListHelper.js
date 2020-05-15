({
    setupTable: function (component) {
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

        component.set('v.cols', cols);
        component.set('v.rows', component.get('v.loanList'));
    }
})