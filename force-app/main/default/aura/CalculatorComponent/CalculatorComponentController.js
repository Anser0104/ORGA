({
    fireCompEvent : function(component, event, helper) {
        var sum = parseInt(component.get("v.firstNumber"))+parseInt(component.get("v.secondNumber"));
        if(parseInt(component.get("v.firstNumber")) ==0 || parseInt(component.get("v.secondNumber")==0)){
            helper.showToast(component, event);
        }else{
            var eventObj = $A.get("e.c:CalculatorApplicationEvent");
            eventObj.setParams({
                "sumresult" : sum
            });
            eventObj.fire();
        } 
    }
})