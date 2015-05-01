@isTest
private class RepeatAndMapDemoTesterTest {

    private static User testAdminUser = RepeatAndMapDemoTester.getTestUser();

    static testMethod void getTestUserTest() {
        System.runAs(testAdminUser) {
            Test.startTest();

            User result = RepeatAndMapDemoTester.getTestUser();

            Test.stopTest();

            System.assertEquals(result.Id, UserInfo.getUserId());
        }
    }

    static testMethod void createAccountTest() {
        System.runAs(testAdminUser) {
            Test.startTest();

            Account account = RepeatAndMapDemoTester.createAccount(false);
            System.assertEquals(String.isEmpty(account.Id), true);

            account = RepeatAndMapDemoTester.createAccount(true);
            System.assertEquals(String.isNotEmpty(account.Id), true);

            Test.stopTest();
        }
    }

    static testMethod void createContactTest() {
        System.runAs(testAdminUser) {

            Account account = RepeatAndMapDemoTester.createAccount(false);

            Test.startTest();

            Contact contact = RepeatAndMapDemoTester.createContact(account, false);
            System.assertEquals(String.isEmpty(contact.Id), true);

            contact = RepeatAndMapDemoTester.createContact(account, true);
            System.assertEquals(String.isNotEmpty(contact.Id), true);

            Test.stopTest();
        }
    }
}