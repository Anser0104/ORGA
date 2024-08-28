({
	handleChange : function(component, event, helper) {
		var compEvent = component.getEvent("msgEvent");
        compEvent.setParams({
            "selectedValue" : component.get("v.selectedIndustry")
        });
        compEvent.fire();
	}
})