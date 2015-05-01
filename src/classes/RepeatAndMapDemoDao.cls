public with sharing class RepeatAndMapDemoDao {

    public RepeatAndMapDemoDao() {
        
    }

    public List<Contact> getContacts() {
        return [    
            SELECT
                 Id
                ,Name
                ,AccountId
                ,Account.Name
                ,Department
                ,Title
            FROM
                Contact
            ORDER BY Name ASC
        ];
    }

    public List<Account> getAccounts(List<Contact> contacts) {
        return [
            SELECT
                 Id
                ,Name
            FROM
                Account
            WHERE
                Id IN (SELECT AccountId FROM Contact WHERE Id IN: contacts)
            ORDER BY Name ASC
        ];
    }
}