({
     	 loadAccountDetails: function(component, event, helper) {
        var accountId = component.get("v.accountId");
      
            var action = component.get("c.getAccountDetails");
            action.setParams({
                "accountId": accountId
            });
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log("responseState: "+state);
                if (state === "SUCCESS") {
                    component.set("v.account", response.getReturnValue());
                    console.log("returnValue " +response.getReturnValue());
                    component.set("v.spinner", false);
                }
            });
            
            $A.enqueueAction(action);  
    }
})