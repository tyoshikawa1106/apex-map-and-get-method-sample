public with sharing class RepeatAndMapDemoController {

    private RepeatandMapDemoHelper helper = new RepeatandMapDemoHelper();
    private RepeatandMapDemoDao dao = new RepeatandMapDemoDao();

    public List<Account> accounts {get; set;}
    private List<Contact> contacts = new List<Contact>();

    public RepeatAndMapDemoController() {
        this.contacts = this.dao.getContacts();
        this.accounts = this.dao.getAccounts(this.contacts);
    }

    public Map<Id, List<Contact>> getTargetContactMap() {
        return this.helper.getContactMap(this.contacts);
    }
}