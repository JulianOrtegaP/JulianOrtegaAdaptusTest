trigger AccountTrigger on Account (before insert, after insert, after delete) {

    AccountTriggerHandler handler = new AccountTriggerHandler();

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            handler.beforeInsert(Trigger.new);
        }
       
    } else if (Trigger.isAfter) {

        if (Trigger.isInsert) {
            handler.afterInsert(Trigger.new);
            
        } else if (Trigger.isDelete) {
            handler.afterDelete(Trigger.old);
        }
 
    }
}