({
    handleClick : function(component, event, helper) {
        var action = component.get("c.getPostalName");
        var branch = component.get("v.branchName");
        console.log('branchName is ' +branch);
        action.setParams({ "postalbranchName" : branch});
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("From server: " + JSON.stringify(response.getReturnValue()));
                console.log("From server: " + (response.getReturnValue()));
                
                var branchNameList = JSON.parse(response.getReturnValue());
                component.set("v.branchList", branchNameList);
                var branchDetails = []; 
                for(let i=0; i<branchNameList.length; i++){
                    if(branchNameList[i].PostOffice && Array.isArray(branchNameList[i].PostOffice)){
                        for(let j=0; j<branchNameList[i].PostOffice.length; j++){
                            branchDetails.push(
                                branchNameList[i].PostOffice[j]);  
                        }
                        
                    }                    
                }
                component.set("v.DisplayResponse", branchDetails);
                console.log('DisplayResponse :' +branchDetails);
                component.set("v.showBody",true);
            }
        });
        $A.enqueueAction(action);
        
    }
})