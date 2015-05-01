@isTest
private class RepeatAndMapDemoHelperTest {

    private static RepeatAndMapDemoHelper helper = new RepeatAndMapDemoHelper();
    private static User testAdminUser = RepeatAndMapDemoTester.getTestUser();

    static testMethod void getContactMapTest1() {
        System.runAs(testAdminUser) {

            List<Contact> contacts = new List<Contact>();

            Test.startTest();

            Map<Id, List<Contact>> results = helper.getContactMap(contacts);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    static testMethod void getContactMapTest2() {
        System.runAs(testAdminUser) {

            Account account = RepeatAndMapDemoTester.createAccount(true);
            Contact contact1 = RepeatAndMapDemoTester.createContact(account, true);
            Contact contact2 = RepeatAndMapDemoTester.createContact(account, true);
            List<Contact> contacts = new List<Contact>();
            contacts.add(contact1);
            contacts.add(contact2);

            Test.startTest();

            Map<Id, List<Contact>> results = helper.getContactMap(contacts);

            Test.stopTest();

            System.assertEquals(results.size(), 1);
            System.assertEquals(results.get(account.Id).size(), 2);
        }
    }
}