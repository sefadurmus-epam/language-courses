@isTest
private class LeadProcessorTest {

    @isTest
    private static void testBatchClass(){
        //Load Data
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<200; i++){
            leads.add(new Lead(LastName='Connock', Company='Salesforce'));
        }
        insert leads;
        
        //Perform the Test
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();
        
        //Check Result
        
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: At least 1 Lead record not updated correctly');
    }
}