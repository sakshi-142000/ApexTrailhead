public with sharing class AccountService {
    public AccountService() {

    }

    /*
    when new account records are created or existing accounts are updated and if type field is set to 'Customer - Direct', 
    system must automatically populate the standard welcome message in desciption field
    */

    public static void setWelcomeMessage(List<Account> newAccounts){
        for(Account acc: newAccounts){
            if(acc.type=='Customer - Direct'){
                acc.description='Welcome to our Direct Customer family! We are thrilled to have you with us.';

            }
        }
    }

    /*
    for existing account records, if annual revenue is descreased and previous value
    was over $1000000, system must prevent the save and display error message to the user
    */

    public static void validateAccountRevenueChange(List<Account> newAccs, Map<Id, Account> oldAccounts){
        for(Account newAcc: newAccs){
            Account oldAcc= oldAccounts.get(newAcc.Id); //get the old account of current new account record

            if(newAcc.AnnualRevenue != null && oldAcc.AnnualRevenue!=null
                && newAcc.AnnualRevenue < oldAcc.AnnualRevenue  
                && oldAcc.AnnualRevenue > 1000000
            ){
                newAcc.AnnualRevenue.addError('Cannot decrease Annual Revenue on high-value accounts.');
            }
        }
    }


    /*
        whenever account is created or updated, if its Rating field is set to 'Hot'
        system must automatically create High Priority Task for immediate follow up
    */

    public static void createRelatedTask(List<Account> newAccounts){
        List<Task> hpTasks= new List<Task>();

        for(Account acc: newAccounts){
            if(acc.Rating == 'Hot'){
                Task newTask= new Task(
                Subject='Follow-up on Account ' + acc.Name,
                Status='Open',
                Priority='High',
                WhatId=acc.Id
            );
            hpTasks.add(newTask);
            }
        }
        if(!hpTasks.isEmpty()) {
            insert hpTasks;
        }

    }


}