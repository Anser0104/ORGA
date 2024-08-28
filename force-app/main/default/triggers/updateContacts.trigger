/*standard account and contact account we have to pull all contact related list from account
Scenario 2 
we need rollup summary functionality(getting the count of children and saving it in parent field) for look up relationship
*/
trigger updateContacts on contact(after insert, after update, after delete, after undelete){
	set<id> accIdSet = new set<id>();

	if(trigger.isInsert || trigger.isUndelete){
		for(contact cnct: trigger.new){
			if(cnct.accountid!=null){
				accIdSet.add(cnct.accountid);
			}
		}
	}
	if(trigger.isdelete){
		for(contact cnct: trigger.old){
			if(cnct.accountid!=null){
				accIdSet.add(cnct.accountid);
			}
		}
	}
	
	if(trigger.isupdate){
		for(contact cnctNew: trigger.new){
			if(cnctNew.accountid!=null){
				accIdSet.add(cnctNew.accountid);
			}
		}
       
            for(contact cnctOld: trigger.old){
			if(cnctOld.accountid!=null){
				accIdSet.add(cnctOld.accountid);
			}
        }
	}
	
	if(accIdSet.size()>0){
		List<Account> accListToUpdate = new List<Account>();
		for(Account acc: [SELECT id, number_Of_Contacts__c,(SELECT id from contacts) FROM Account WHERE id IN: accIdSet]){
			if(acc.contacts.size()>0){
				acc.number_Of_Contacts__c= acc.contacts.size();
			}else{
				acc.number_Of_Contacts__c=0;
			}
			accListToUpdate.add(acc);
		}
		if(accListToUpdate.size()>0){
			try{
				update accListToUpdate;
			}
			catch(exception ex){
				system.debug('error is '+ex.getMessage());
			}
		}
	}

}