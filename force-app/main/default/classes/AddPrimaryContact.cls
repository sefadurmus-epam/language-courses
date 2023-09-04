public without sharing class AddPrimaryContact implements Queueable {

    private Contact contact;
   	private String state;
    
    public addPrimaryContact(Contact inputContact, String inputState){
        this.contact = inputContact;
        this.state = inputState;
    }
    
    public void execute(QueueableContext context){
        //Retrieve 200 Account records
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        
        //Create empty list of Contact records
        List<Contact> contacts = new List<Contact>();
        
        //Iterate through the Account records
        for(Account acc: accounts){
            
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
            
        }
        
        insert contacts;
    }
}