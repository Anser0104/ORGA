({
    returnAccounts : function(Component) {
        Component.set('v.columns', [
            {label: 'Account Id', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
        ]);
       
        
        var action = Component.get("c.getAccountRecords");
        //action.setParams({ firstName : Component.get("v.firstName") });
		action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                Component.set("v.accList",response.getReturnValue());
                if(response.getReturnValue().length==0){
                    Component.set("v.hasRecords",false);
                }else{
                    Component.set("v.hasRecords",true);
                }
            }
        });
        $A.enqueueAction(action);
    }
})