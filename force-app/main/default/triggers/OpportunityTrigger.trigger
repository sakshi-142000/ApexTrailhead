/*
whenever an Opportunity is Closed Won, create a task for Opportunity owner to split
the revenue among the team with high priority
*/

trigger OpportunityTrigger on Opportunity (after update) {

    if(Trigger.isUpdate && Trigger.isAfter){

        OpportunityTriggerHandler.createTaskForRevenueSplit(Trigger.new);
    }

}