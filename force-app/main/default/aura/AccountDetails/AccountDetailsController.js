({
      
    handlleAppEvent:function(component, event, helper){
        component.set("v.spinner", true);
        var accrecId = event.getParam("acctId");
        console.log("AccountId" +accrecId);         
        component.set("v.accountId", accrecId);        
        helper.loadAccountDetails(component, event, helper);
        
    },
    
    openPopupModal:function(component, event, helper){
     component.set("v.popUpModal", true);   
    },
     closeModel:function(component, event, helper){
     component.set("v.popUpModal", false);   
    },
    saveDetails:function(component, event, helper){
        var accdetailcomp = component.find("accdetailsId");
        accdetailcomp.accMethod(component.get("v.accountId"));
       
       },
    handleComponentEvent : function(cmp, event,helper) {
         cmp.set("v.popUpModal", false);
         helper.loadAccountDetails(cmp, event, helper);
        var AccAppEvent = $A.get("e.c:AppEventToAccountRecords");
        AccAppEvent.fire();
    }
     
})