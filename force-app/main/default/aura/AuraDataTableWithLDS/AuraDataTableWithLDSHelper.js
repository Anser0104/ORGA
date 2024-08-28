({
	getContacts : function(component, event, helper) {
        component.set('v.Columns',[
            {label:'First Name',fieldName:'FirstName', type:'text'},
            {label:'Last Name',fieldName:'LastName', type:'text'},
            {label:'Clean Status',fieldName:'CleanStatus', type:'text'}
        ]);
        var action = component.get("c.getContactList");
        action.setParams({
            
        });
        action.setCallback(this, function(response){
            var State = response.getState();
            if(State === "SUCCESS"){
                component.set("v.Contacts", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})