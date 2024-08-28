@RestResource(urlMapping='/Account/*')
global with sharing class restApiclass{

@HttpGet
	global static List<Account> getAccounts(){
		RestRequest req  = RestContext.request;
		RestResponse res = RestContext.response;
		
		List<Account> acclist = [SELECT Id, Name, Phone, Website FROM Account limit 10];
		return acclist;
	}

}