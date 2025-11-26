trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    // before context
    if(Trigger.isBefore){

        if(Trigger.isInsert || Trigger.isUpdate){
            AccountService.setWelcomeMessage(Trigger.new); 
        }

        if(Trigger.isUpdate){
            AccountService.validateAccountRevenueChange(Trigger.new, Trigger.oldMap);
        }
    }

    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            AccountService.createRelatedTask(Trigger.new);
        }
    }

}