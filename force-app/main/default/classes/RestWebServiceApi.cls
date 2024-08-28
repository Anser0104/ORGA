@RestResource(urlMapping='/AccountAPI/*')
    global with sharing class RestWebServiceApi {
        @HTTPGet //Retrieve	
        global static list<Account> getAccounts(){
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            String searchKey = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);        
            List<Account> accounts = [SELECT Id, Name, Email__c, Industry, Phone FROM Account WHERE Email__c =: searchKey AND Email__c != NULL ];
            system.debug('Accounts: ' +accounts);
            try{
                res.statusCode = 200;
                return accounts;
            }catch(CalloutException e){
                res.statusCode = 400;
                throw new CalloutException('Error while Fetching Accounts: ' +e.getMessage());
            }
            
        }
        global class accountWrapperFields{             
            String message;
            String name;
            String phone;
            String email;
            String error;
            
            public accountWrapperFields(String message,String name,String email,String phone,String error){               
                this.message = message;
                this.name = name;               
                this.email = email;
                this.phone = phone;
                this.error = error;                
            }
        }
        @HTTPPost //Create
        global static String CreateAccount(){
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            String jsonString = req.requestBody.toString();
            Account acc = (Account) JSON.deserialize(jsonString, Account.class);
            try{               
                insert acc;
                
                res.statusCode = 201;
                return JSON.serialize(new accountWrapperFields('Successfully Account Record has been Created.! AccountId: '+acc.Id, acc.Name, acc.Email__c, acc.Phone,null));
            }catch(Exception e){
                res.statusCode = 400;
                return JSON.serialize(new accountWrapperFields('Error Creating Account. AccountId: '+acc.Id, null, null, null, e.getMessage()));
            }
        }
        
        global class updateWrapper{
            public String name;
            public String phone;
            public String industry;
            public String message;
            
            public updateWrapper(String message, String name, String phone, String industry){
                this.message = message;
                this.name = name;
                this.phone = phone;
                this.industry = industry;                
            }
        }
        @HTTPPut // update
        global static String UpdateAccount(){
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            String jsonString = req.requestBody.toString();
            Account account = (Account) JSON.deserialize(jsonString, Account.class);
            try{
                update account;            
                res.statusCode = 200;
                return JSON.serialize(new updateWrapper('Account Updated Successfully!! '+account.Id,account.Name,account.Phone,account.Industry));
            }catch(Exception e){
                res.statusCode = 400;
                return JSON.serialize(new updateWrapper(e.getMessage(),null,null,null));
            }          
        }
        global class AccountWrapper{
            String success;
            String message;
        }
        @HTTPPatch //Bulk Upsert
        global static List<AccountWrapper> upsertAccounts() {
            List<AccountWrapper> accountWrapperList = new List<accountWrapper>();
            RestRequest req	=	RestContext.request;
            String accountsJSON = req.requestBody.toString();
            List<Account> accountsList = (List<Account>) JSON.deserialize(accountsJSON, List<Account>.class);
            Database.SaveResult[] UpdatedResults = Database.update(accountsList, false);
            for(Database.SaveResult UpdatedResult: UpdatedResults){
                AccountWrapper acctWrapper = new AccountWrapper();
                if(UpdatedResult.isSuccess()){
                    acctWrapper.success = '1,' + ' Total Records Successfully Updated: '+UpdatedResults.size();
                    acctWrapper.message = 'successfully updated Account Id: ' + UpdatedResult.getId();                   
                }
                else {
                    // Operation failed, so get all errors  
                    acctWrapper.success = '0';              
                    for(Database.Error err : UpdatedResult.getErrors()) {
                        acctWrapper.message = ('The following error has occurred with Account Id: ' +UpdatedResult.getId())+ '.';                    
                        acctWrapper.message += (err.getStatusCode() + ': ' + err.getMessage()) + '.';
                        acctWrapper.message += ('Account fields that affected this error: ' + err.getFields());
                    }
                }   accountWrapperList.add(acctWrapper);  
                
            }       return accountWrapperList;           
        }
        
        global class Response{
            public Boolean success;
            public String message;
            public String error;                      
        }
        @HTTPDelete  // Delete record
        global static Response deleteAccount(){
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); 
            try{
                Account acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
                delete acc;
                
                res.statusCode = 200;
                Response re = new Response();
                re.success = true;
                re.message = 'Account deleted Successfully.!!';
                re.error = 'null';
                return re;
                // return JSON.serializ(re);
            }
            catch(Exception e){
                res.statusCode = 400;
                Response re = new Response();
                re.success = false;
                re.message = 'Error deleting Account.';
                re.error = e.getMessage();
                return re;
                //return JSON.serialize(re);
            }             
        }  
    }
    
    /*
    System.debug(system.Url.getOrgDomainUrl());-->BaseURL
    
    Access Token:
    system.debug(system.UserInfo.getSessionId().SubString(15));
    
    !AQ8AQC2rkrSSdZOwyk.51_KE5yCgAT62.5LUOa7NWzWsB.z1V3TWoBTf7NIXrszk2.r3Al4gczn.Sl77y_uSvu16oJH.eIOY
    */