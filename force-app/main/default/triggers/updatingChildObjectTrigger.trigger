trigger updatingChildObjectTrigger on Account (before insert,
                                               before update,
                                               before delete,
                                               after insert,
                                               after update,
                                               after delete,
                                               after undelete)
{
     System.debug('trigger is executed');
    updatingChildObjectTriggerHandler.UpdateContactPhone(trigger.new);
}