({
    doInit : function(component, event, helper) {
        var action = component.get("c.getRecords");
        action.setParams({ objName : component.get("v.sObjName") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.data",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})