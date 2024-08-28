({
    retunAccounts : function(component, event, helper) {
       component.set('v.columns', [
            {label: 'Account Id', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
        ]);
        
        var action = component.get("c.listoutRecords");
        //action.setParams({ firstName : cmp.get("v.firstName") });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acclist",response.getReturnValue());
                if(response.getReturnValue().length==0){
                    component.set("v.hasRecords", false);
                }else{
                    component.set("v.hasRecords", true);
                }
            }
        });
        $A.enqueueAction(action);
    }
})