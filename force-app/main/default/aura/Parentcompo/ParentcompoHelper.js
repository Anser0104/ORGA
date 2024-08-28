({
    showToast : function(component, event) {
        var toastEvent = $A.get("e.force:showToast");
        if(component.find("childId")==null){
            toastEvent.setParams({
                "title": "Error!",
                "message": "The message not forward successfully.",
                "type": "error"
            });
            
        }else{
             toastEvent.setParams({
                "title": "Success!",
                "message": "The message forward successfully.",
                "type": "success"
            });toastEvent.fire();
        }
        }
   
})