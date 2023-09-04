@isTest
private class TestRestrictContactByName {
	
    static testMethod void metodoTest(){
        
        List<Contact> listContact = new List<Contact>();
        Contact c1 = new Contact(FirstName = 'Francesco', LastName = 'INVALIDNAME', email = 'Test@test.com');
        Contact c2 = new Contact(FirstName = 'Francesco1', LastName = 'INVALIDNAME', email = 'Test1@test.com');
		listContact.add(c1);
        listContact.add(c2);
        
		insert listContact;
    }
}