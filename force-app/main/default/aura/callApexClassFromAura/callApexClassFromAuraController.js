({
    handleClick : function(component, event, helper) {
        var action = component.get("c.apexMethod");
        
        //action.setParams({ firstName : component.get("v.firstName") });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.messageFromApex",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})