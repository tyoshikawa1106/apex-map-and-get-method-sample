public with sharing class RepeatAndMapDemoHelper {

    public RepeatAndMapDemoHelper() {
        
    }

    public Map<Id, List<Contact>> getContactMap(List<Contact> contacts) {
        Map<Id, List<Contact>> contactMap = new Map<Id, List<Contact>>();
        for (Contact c : contacts) {
            if (String.isNotEmpty(c.AccountId)) {
                List<Contact> cList = new List<Contact>();
                if (contactMap.containsKey(c.AccountId)) {
                    cList = contactMap.get(c.AccountId);
                }
                // Add List
                cList.add(c);
                // Add Map
                contactMap.put(c.AccountId, cList);
            }
        }

        return contactMap;
    }
}