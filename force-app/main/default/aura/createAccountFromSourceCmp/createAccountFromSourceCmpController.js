({
    handleClick : function(component, event, helper) {
        var acctName = component.get("v.Name");
        var acctIndustry = component.get("v.industry");
        
        var action = component.get("c.createAccountinTargetOrg");
        action.setParams({
            "accName" : acctName,
            "accIndustry" : acctIndustry,
            /*"accountName" : acctName,
            "accountIndustry" : acctIndustry,
            "targetEndpoint" : 'https://tcscombasha-dev-ed.develop.my.salesforce.com/services/apexrest/createAccount/',
            "accessToken" : 'JLUUnhHhLM5qWxnBPaMf30ga'*/
        });
        
        action.setCallback(this,function(response){
            var state= response.getState();
            if(state === 'SUCCESS'){
                //console.log('Response :' +response.getReturnValue());
                //  var accID = JSON.parse(response.getReturnValue());
                // component.set("v.Id",accID);
                alert("Account created successfully: " + response.getReturnValue());
                var str = JSON.parse(response.getReturnValue());
                component.set("v.Id",str);
            } else {
                console.error("Error creating account: " + response.getError()[0].message);
            }                           
                           });
        $A.enqueueAction(action);
    }
})