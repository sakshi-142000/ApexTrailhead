// Use Case 2: Wheneve lead record is updated, set the lead status to working-contacted
trigger LeadTrigger on Lead (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        for(Lead lead: Trigger.new){
            Lead.Status='Working - Contacted';
        }
    }
}