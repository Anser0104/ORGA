({
	handleClick : function(component, event, helper) {
        var selectedpin = component.get("v.pincode");
        var selectedtype = component.get("v.selectPostalopt");
        var apEvent = $A.get("e.c:postalAPPEvent");
        apEvent.setParams({
            "selectedPostalType1" : selectedpin ,
             "PostalTypes" : selectedtype
        });
        apEvent.fire();
	}
})