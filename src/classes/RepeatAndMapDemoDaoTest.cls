@isTest
private class RepeatAndMapDemoDaoTest {

    private static RepeatAndMapDemoDao dap = new RepeatAndMapDemoDao();
    private static User testAdminUser = RepeatAndMapDemoTester.getTestUser();

    static testMethod void getContactsTest1() {
        System.runAs(testAdminUser) {
            Test.startTest();

            List<Contact> results = dap.getContacts();

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    static testMethod void getContactsTest2() {
        System.runAs(testAdminUser) {

            Account account = RepeatAndMapDemoTester.createAccount(true);
            Contact contact = RepeatAndMapDemoTester.createContact(account, true);

            Test.startTest();

            List<Contact> results = dap.getContacts();

            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }

    static testMethod void getAccountsTest1() {
        System.runAs(testAdminUser) {

            List<Contact> contacts = new List<Contact>();

            Test.startTest();

            List<Account> results = dap.getAccounts(contacts);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    static testMethod void getAccountsTest2() {
        System.runAs(testAdminUser) {

            Account account = RepeatAndMapDemoTester.createAccount(true);
            Contact contact = RepeatAndMapDemoTester.createContact(account, true);
            List<Contact> contacts = new List<Contact>();
            contacts.add(contact);

            Test.startTest();

            List<Account> results = dap.getAccounts(contacts);

            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}