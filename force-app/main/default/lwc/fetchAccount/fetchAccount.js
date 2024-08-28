import { LightningElement,wire } from 'lwc';
import getAccount from '@salesforce/apex'

export default class FetchAccount extends LightningElement {
    wire
    accounts;
    
}