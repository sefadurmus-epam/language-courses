public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String postalCode){
        List<Contact> Contacts = [Select Id,Name from Contact where LastName =: lastName and MailingPostalCode =: postalCode];
        return Contacts;
    }
}