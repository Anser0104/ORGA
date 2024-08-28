({
    doinit: function(component, event, helper) {
        helper.getAccountData(component);
    },
     showDetails: function(component, event, helper) {
         console.log("recordId: "+event.currentTarget.dataset.recordId);
         var currentRecId = event.currentTarget.dataset.recordId;
         var appEvent = $A.get("e.c:AapEventforGetAccountData");
         appEvent.setParams({"acctId": currentRecId});
       appEvent.fire();         
    },
    
    openPopupModal:function(component, event, helper){
     component.set("v.popUpModal", true);   
    },
     closeModel:function(component, event, helper){
     component.set("v.popUpModal", false);   
    }
})