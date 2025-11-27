// BR: wheneve task is created, set the priority to high

trigger TaskTrigger on Task (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            for(Task tsk: Trigger.new){
                tsk.Priority='High';
            }
        }
    }
    
}