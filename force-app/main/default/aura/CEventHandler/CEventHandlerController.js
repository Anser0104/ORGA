({
	getrecords : function(component, event, helper) {
        component.set("v.showSpinner", true);
        //console.log('here'); 
        var param = event.getParam("SelectRcord");
      //  console.log('param==>'+param);   
        component.set("v.listofRecords",param);
        
		component.set('v.columns', [
            {label: 'Account Id', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Rating', fieldName: 'Rating', type: 'text'},
        ]);
        
        var action = component.get("c.retunAccountRecords");
        action.setParams({ accName : param });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('state==>'+state);
            if (state === "SUCCESS") {
                component.set("v.data",response.getReturnValue());
            component.set("v.showSpinner", false);
            }
        });
        $A.enqueueAction(action);
	}
})