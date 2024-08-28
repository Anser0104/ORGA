global class UpdateChildContactsOfAccountBatchApex implements Database.Batchable<Sobject>,Database.Stateful
{
	list<Id> accIds = new list<Id>();
    public UpdateChildContactsOfAccountBatchApex(List<Id>AccountIds) {
	this.accIds = AccountIds;
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('start method');
        return Database.getQueryLocator('select Id,Phone,Account.Phone FROM Contact where AccountId IN:accIds');
    }
    global void execute(Database.BatchableContext BC, List<Contact> conlist) {
        system.debug('Execute method');
        list<Contact> updatedconList = new list<Contact>();
        for(Contact con: conlist){
            con.Phone = con.Account.Phone;
            updatedconList.add(con);
        }
        if(!updatedconList.isEmpty())
        {
            update updatedconList;
        }
    }
    global void finish(Database.BatchableContext BC) {
    }
}