public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailPostCode) {

        List<Contact> conts= [Select id, Name from Contact where 
        
        (LastName=:lastName and MailingPostalCode=:mailPostCode)];

        return conts;

    }
}