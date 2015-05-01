public with sharing class RepeatAndMapDemoTester {

    public static User getTestUser() {
        return new User(Id = UserInfo.getUserId());
    }

    public static Account createAccount(Boolean isInsert) {
        Account account = new Account(
            Name = 'Sample'
        );
        
        if (isInsert) {
            insert account;
        }

        return account;
    }

    public static Contact createContact(Account account, Boolean isInsert) {
        Contact contact = new Contact(
             LastName = 'Sample'
            ,AccountId = account.Id
        );
        
        if (isInsert) {
            insert contact;
        }

        return contact;
    }
}