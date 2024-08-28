import { LightningElement, track,wire,api } from 'lwc';
import getAccounts from '@salesforce/apex/accountSearch.getAccountRecords';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
 const cols = [
            {label:'AccountName', fieldName: 'Name',type: "url",
            typeAttributes:{label:{fieldName:'Name'},target:'_blank'},
            },
            {label:'Phone' ,fieldName:'Phone', type:'Phone'},
            {label:'Industry' ,fieldName:'Industry', type:'Picklist'}
    ]
export default class ccount_Search extends LightningElement  {

 @track accountRecords;
 searchValue = '';
 error;
 cols = cols;
 //@api recordId;


     getallaccounts() {
        getAccounts()
        .then(result => {
            this.accountRecords = result;
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error while getting Accounts', 
                    message: error.message, 
                    variant: 'error'
                }),
            );
            this.data = undefined;
        });
    }

    @wire ( getAccounts,{recordId:'$recordId',searchkey: this.searchValue} )  
    wiredAccount( { error, data } ) {

        if ( data ) {
            
            let tempRecs = [];
            data.forEach( ( record ) => {
                let tempRec = Object.assign({}, record );  
                console.log(tempRec);
                tempRec.AccountName = 'https://hcl518-dev-ed.lightning.force.com/lightning/r/Account/'+$recordId+'/view';
                console.log(tempRec.AccountName);
                tempRecs.push(tempRec);
                
            });
            this.accountRecords = tempRecs;
            this.error = undefined;

        } else if ( error ) {

            this.error = error;
            this.accountRecords = undefined;

        }

    }
   
  //This Funcation will get the value from Text Input.
   handelSearchKey(event)
    {
        this.searchValue = event.currentTarget.value;
    }

    //This funcation will fetch the Account Name on basis of searchkey
    SearchAccountHandler()
    {
        
        
        if(this.searchValue !== '')
            {
                
                getAccounts({searchkey: this.searchValue})
                    .then(result => {
                    this.accountRecords = result;
                })
                .catch(error => {
                    this.accountRecords = undefined;
                });
            }
            
            else{
                // fire toast event if input field is blank
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Search text missing..',
            });
            this.dispatchEvent(event);
            }
            
    }

}