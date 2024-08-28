({
	jsmethod : function(component, event, helper) {
		var params = event.getParam("arguments");
        if(params){
            var param1 = params.message;
            component.set("v.Parentmsg",param1);
        }
	}
})