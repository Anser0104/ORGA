({
	handleClick : function(component, event, helper) {
		var inputValue = component.get("v.someText");
        var childCmp = component.find("childId");
        childCmp.callChildMethod(inputValue);
	}
})