({
    handleNew : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "type": "Success",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    }
})