({
	handleClick : function(component, event, helper) {
        var action = component.get("c.messagefromAuraMethod");
        //action.setParams({ firstName : cmp.get("v.firstName") });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.message",response.getReturnValue());
            }         
        });
       $A.enqueueAction(action);
    }
})