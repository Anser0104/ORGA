({
	onload : function(component, event, helper) {
       
         component.set('v.columns', [
            {label: 'Opportunity Name', fieldName: 'Name', type: 'text'},
            {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},
            {label: 'Stage', fieldName: 'StageName', type: 'text'},
             {label: 'Action', fieldName: 'Action', type: 'button'}
        ]);
        var accId = component.get("v.recordId");
		var action = component.get("c.getoppoRecords");
        action.setParams({
            "accountId":accId
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.data",response.getReturnValue());
                 component.set("v.Opportunitylist",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
    clickhandle : function(component, event, helper) {
       
    var editRecordEvent = $A.get("e.force:editRecord");
    editRecordEvent.setParams({
        "recordId": component.get("v.recordId")
        
    });
    editRecordEvent.fire();
       
},
    handleReset: function(cmp, event, helper) {
        cmp.find('field').forEach(function(f) {
            f.reset();
        });
    },
   // handleSelect : function(component, event, helper) {
       // alert('test');
    //},
    clickhandle : function(component, event, helper) {
        component.set("v.popup",true);
        component.set("recIds",component.get("value"));
    },
    openModel: function(component, event, helper) {
        component.set("v.popup", true);
    },
    
    closeModal: function(component, event, helper) { 
        component.set("v.popup", false);
    }
})