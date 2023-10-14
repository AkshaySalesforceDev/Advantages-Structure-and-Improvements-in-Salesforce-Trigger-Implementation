/**
 * @description       : ParentObjectTriggerHandler class to update sum amount on parent record.
 * @author            : Akshay S
**/

public class ParentObjectTriggerHandler {
    public static void handleChildRecords(List<ChildObject__c> childRecords) {
        // Logic to calculate the sum of Amount from child records
        Decimal totalAmount = 0;
        for (ChildObject__c child : childRecords) {
            totalAmount += child.Amount__c;
        }
        // Update the Parent record with the totalAmount
        List<ParentObject__c> parentsToUpdate = new List<ParentObject__c>();
        for (ChildObject__c child : childRecords) {
            ParentObject__c parent = new ParentObject__c(Id = child.ParentId__c, Total_Amount__c = totalAmount);
            parentsToUpdate.add(parent);
        }
        if (!parentsToUpdate.isEmpty()) {
            update parentsToUpdate;
        }
    }
}