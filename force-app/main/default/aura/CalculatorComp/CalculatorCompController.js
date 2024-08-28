({
    handleClick: function(component, event, helper){
        var btnName = event.getSource().get("v.label");
        var fNum = component.get("v.fNum");
        var sNum = component.get("v.sNum");
        console.log('btnName==>'+btnName);
        helper.calcMethod(component, event,btnName, fNum, sNum);
    },
    /*handleClick: function(component, event, helper){
        var fnumValue = component.find("firstNumberId").get("v.value");  
        console.log('fnumValue==>'+fnumValue);
        var fnumLabel = component.find("firstNumberId").get("v.label");  
        console.log('fnumLabel==>'+fnumLabel);
        var fnumName = component.find("firstNumberId").get("v.name");  
        console.log('fnumName==>'+fnumName);
        
        
        var snumValue = component.find("secondNumberId").get("v.value");  
        console.log('snumValue==>'+snumValue);
    }*/
})