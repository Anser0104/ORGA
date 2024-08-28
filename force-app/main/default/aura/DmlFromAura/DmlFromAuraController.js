({
    createAccount : function(component, event, helper) {
        var action = component.get("c.insertAccountRecord");
        
        action.setParams({ 
            accName : component.get("v.accountName"),
            accIndustry : component.get("v.accountIndustry")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accId",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})