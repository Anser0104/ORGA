({
    
    handleClick : function(component, event, helper) {        
         var PostalType1 = event.getParam("PostalTypes");
        component.set("v.PostalType", PostalType1);
         var message = event.getParam("selectedPostalType1");
        component.set("v.pincode", message);
        
        var action  = component.get("c.getPostalDetails");
        var pincode = component.get("v.pincode");
        console.log('pincode is ' +pincode);        
        action.setParams({ "pin" : component.get("v.pincode")});        
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("From server: " + JSON.stringify(response.getReturnValue()));
                         console.log("From server: " + (response.getReturnValue()));

                var ResresultList = JSON.parse(response.getReturnValue());
                component.set("v.pincodeList",ResresultList);
                var cols = []; 
                for(let i=0; i<ResresultList.length; i++){
                    for(let j=0; j<ResresultList[i].PostOffice.length; j++){
                        cols.push(
                            ResresultList[i].PostOffice[j]);
                    }                    
                }
                component.set("v.DisplayResponse",cols);
                component.set("v.showBody",true);
            }
        });
        $A.enqueueAction(action);
        
    }
})