({
    showToast : function(component, event) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Its an success",
            "type" : "success"
        });
        toastEvent.fire();
    }
})