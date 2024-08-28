({
	 loadAccountDetails: function(component, event, helper) {
          component.set("v.spinner",true);
        var accountRecId = component.get("v.accRecordId");      
            var action = component.get("c.editAccountDetails");
            action.setParams({
                "accountrecId": accountRecId
            });
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log("responseState: "+state);
                if (state === "SUCCESS") {
                    console.log("returnValue " +response.getReturnValue());
                    component.set("v.Account", response.getReturnValue());                    
                     component.set("v.spinner",false);
                }
            });
            
            $A.enqueueAction(action);
        
    },
    saveAccDetails : function(component, event, helper){       
        var accountdata = component.get("v.Account");
        
        console.log("AcccountUpdateddata " +accountdata);
			var action = component.get("c.saveAccountDetails");	
         action.setParams({
                "account": accountdata
            });
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log("responseState: "+state);
                if (state === "SUCCESS") {
                    console.log("ReturnValue " +response.getReturnValue());
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Success!",
                        "type": "Success",
                        "message": "The record has been updated successfully."
                    });
                    toastEvent.fire();
                    var parenttoEvent = component.getEvent("parentEvent");
                    parenttoEvent.fire();
                }
            });
            
            $A.enqueueAction(action);
    }
})