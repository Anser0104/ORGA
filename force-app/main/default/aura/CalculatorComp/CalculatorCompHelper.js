({
    calcMethod : function(component, event, btnName, fNum, sNum) {
        var action = component.get("c.calculate");
        
        action.setParams({ 
            buttonName : btnName, 
            firstNumber :  fNum, 
            secondNumber : sNum
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.fResult", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
        /*var fResult;
        switch(btnName) {
            case 'Add':
                fResult = parseInt(fNum) + parseInt(sNum);
                break;
            case 'Substract':
                fResult = parseInt(fNum) - parseInt(sNum);
                break;
            case 'Multiply':
                fResult = parseInt(fNum) * parseInt(sNum);
                break;
            case 'Divide':
                fResult = parseInt(fNum) / parseInt(sNum);
                break;
        }
        component.set("v.fResult",fResult);*/
    }
})