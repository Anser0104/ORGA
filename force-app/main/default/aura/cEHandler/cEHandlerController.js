({
    getData : function(component, event, helper) {
        var param = event.getParam("selectedValue");
        component.set("v.SelectedOptionValue",param);
        
        component.set('v.columns', [
            {label: 'Account Id', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Rating', fieldName: 'Rating', type: 'text'}
        ]);
        
        var action = component.get("c.getAccountRecords");
        action.setParams({ accIndustry : param });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.data",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})