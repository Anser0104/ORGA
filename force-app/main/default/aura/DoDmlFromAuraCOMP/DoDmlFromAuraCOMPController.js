({
    CreateContact : function(component, event, helper) {
        var action = component.get("c.insertcontactRecord");
        
        action.setParams({
            conSalutation : component.get("v.Salutation"),
            conLastname : component.get("v.LastName"),
           // conAccountId : component.get("v.AccountId")
                         });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.conId",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})