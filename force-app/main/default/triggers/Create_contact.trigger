trigger Create_contact on Account (after insert, after update) {
    Createcontacthelper.Createcontactmethod(trigger.newmap,trigger.oldmap);
}