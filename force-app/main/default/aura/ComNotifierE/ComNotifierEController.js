({
	handleChange : function(component, event, helper) {
		var compEvent = component.getEvent("msgEvent");
        compEvent.setParams({
            "Selectedoption" : component.get("v.SelectedIndustry")
        });
        compEvent.fire();
	}
})