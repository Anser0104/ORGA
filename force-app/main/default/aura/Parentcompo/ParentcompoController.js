({
    callmethod : function(component, event, helper) {
        var inputmsg = component.get("v.msg");
        if(component.find("childId")!=null){
            var childcomp = component.find("childId");
            childcomp.Childjsmethod(inputmsg);
            helper.showToast(component, event);        }
        else{
            helper.showToast(component, event);
        }
    }
})