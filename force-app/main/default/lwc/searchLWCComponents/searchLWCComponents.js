import {LightningElement, wire} from 'lwc';
import searchRecordsData from '@salesforce/apex/searchSobjectsRecords.searchRecordsData';
const columns = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Industry', fieldName: 'Industry' ,type: 'Picklist'},
    { label: 'Phone', fieldName: 'Phone', type: 'Phone' },
    { label: 'Email', fieldName: 'Email' , type: 'Email'},
];


export default class searchLWCComponents extends LightningElement {
     Accounts = [];
     columns = columns;
     searchKey;
     showRecords = false;
     recordId;

    searchRecordsData(){
        searchRecordsData({keyword: this.searchKey})
            .then(result => {
                this.Accounts = result;
                if(result.length > 0) {
                    this.showRecords = true;
                } else{
                    this.showRecords = false;
                }
            })
            .catch(error => {
            });
    }
     
    handleKeyChange(event){
        this.searchKey = event.target.value;
    }

    

}