/**
 * @description       : TriggerFactory class to hanlde the trigger operations
 * @author            : Akshay S
**/
public class TriggerFactory {
    public static void handle(String objectName, List<sObject> records, TriggerOperation operation) {
        if (objectName == 'ChildObject__c') {
            if (operation == TriggerOperation.AFTER_INSERT || operation == TriggerOperation.AFTER_UPDATE) {
                ParentObjectTriggerHandler.handleChildRecords((List<ChildObject__c>) records);
            }
        }
    }
}
