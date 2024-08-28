({
	handleChange : function(component, event, helper) {
        var eventobj = $A.get("e.c:CEvent1");
        eventobj.setParams({
            "SelectRcord" : component.get("v.SelecteRecord")
        });
        eventobj.fire();		
	}
})