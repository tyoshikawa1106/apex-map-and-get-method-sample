@isTest
private class RepeatAndMapDemoControllerTest {

    private static User testAdminUser = RepeatAndMapDemoTester.getTestUser();

    static testMethod void RepeatAndMapDemoControllerTest1() {
        System.runAs(testAdminUser) {

            Test.startTest();

            RepeatAndMapDemoController cls = new RepeatAndMapDemoController();
            cls.getTargetContactMap();

            Test.stopTest();

            System.assertEquals(cls.accounts.isEmpty(), true);
        }
    }

    static testMethod void RepeatAndMapDemoControllerTest2() {
        System.runAs(testAdminUser) {

            Account account = RepeatAndMapDemoTester.createAccount(true);
            Contact contact = RepeatAndMapDemoTester.createContact(account, true);

            Test.startTest();

            RepeatAndMapDemoController cls = new RepeatAndMapDemoController();
            cls.getTargetContactMap();

            Test.stopTest();

            System.assertEquals(cls.accounts.size(), 1);
        }
    }
}