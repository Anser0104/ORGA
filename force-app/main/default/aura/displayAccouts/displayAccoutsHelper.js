({
	getAccountData: function(component) {
        var action = component.get("c.getAccountRecords");
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("List of Acc Records: " +response.getReturnValue());
                component.set("v.accounts", response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})