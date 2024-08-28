({
	onload : function(component, event, helper) {
         component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'AccountNumber', fieldName: 'AccountNumber', type: 'text'}
        ]);
        
		var action = component.get("c.getAcc");
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state=="SUCCESS"){
                component.set("v.data",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})