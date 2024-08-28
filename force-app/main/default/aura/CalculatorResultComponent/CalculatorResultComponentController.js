({
	getResult : function(component, event, helper) {
		var addedValue= event.getParam("sumresult");
        component.set("v.result",addedValue);
	}
})