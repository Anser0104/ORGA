trigger updateDateOnAccount on Account (After Update){    
    updateDateOnAccountHandlerClass.updateDateOnAccountMethod(trigger.new, trigger.oldMap);
}