({
    createAcc: function(component, event, helper) {
        var accountName = component.get("v.accountName");
        var email = component.get("v.email");
        var annualRevenue = component.get("v.annualRevenue");

        var action = component.get("c.createAccount");
        action.setParams({
            "accountName": accountName,
            "email": email,
            "annualRevenue": annualRevenue
        });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("Account created successfully");                
                  var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record was saved successfully.",
            "type": "success"
        });
        toastEvent.fire();
            } 
        });

        $A.enqueueAction(action);
    }
})