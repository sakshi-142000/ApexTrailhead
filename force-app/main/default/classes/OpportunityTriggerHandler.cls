public with sharing class OpportunityTriggerHandler {
    public OpportunityTriggerHandler() {

    }

    public static void createTaskForRevenueSplit(List<Opportunity> oops){
        List<Task> tasks= new List<Task>();
         for(Opportunity opp : oops){
            if(opp.StageName=='Closed Won'){
                Task tsk= new Task(
                    Subject='Split Revenue for the Opportunity '+ opp.Name,
                    Priority='High',
                    OwnerId=opp.OwnerId,
                    WhatId=opp.Id
                );
                tasks.add(tsk);
            }
        }

        insert tasks;
    }
}