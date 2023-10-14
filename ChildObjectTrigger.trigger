/**
 * @description       : Trigger on ChildObject__c
 * @author            : Akshay S
**/
trigger ChildObjectTrigger on ChildObject__c (after insert, after update) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            TriggerFactory.handle('ChildObject__c', Trigger.new, Trigger.operationType);
        }
    }
}