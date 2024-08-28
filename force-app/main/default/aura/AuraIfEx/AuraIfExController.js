({
	handleClick : function(component, event, helper) {
        if(component.get("v.truthy")==true){
            component.set("v.truthy",false);
        }else{
            component.set("v.truthy",true);
        }
	}
})