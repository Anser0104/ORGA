({
	changeValue : function(component, event, helper) {
		var variable = component.get("v.isTrueVariable");
        if(variable==true){
            component.set("v.isTrueVariable", false);
        }else{
            component.set("v.isTrueVariable", true)
        }
	}
})