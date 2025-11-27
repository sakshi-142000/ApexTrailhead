// Use case 3: Whenever a case is created and Case origin is phone, 
// set priority as high, else low
trigger CaseTrigger on Case (before insert) {

    if(Trigger.isInsert && Trigger.isBefore){
        for(Case caseRecord: Trigger.new){
            if(caseRecord.Origin=='Phone'){
                caseRecord.Priority='High';
            }
            else caseRecord.Priority='Low';
        }
    }

}