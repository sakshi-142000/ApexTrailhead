public with sharing class ContactAndLeadSearch {
    public ContactAndLeadSearch() {

    }

    public static List<List< sObject>> searchContactsAndLeads(String name){

        return [FIND :name In Name FIELDS RETURNING Contact(Id, FirstName, LastName), Lead(Id, FirstName, LastName)];

    }
}

