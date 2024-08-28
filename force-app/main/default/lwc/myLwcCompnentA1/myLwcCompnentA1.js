import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';

export default class MyLwcCompnentA1 extends LightningElement {
    Contact=CONTACT_OBJECT;
    fields=[NAME_FIELD,PHONE_FIELD,EMAIL_FIELD,ACCOUNTID_FIELD];
   
    onContactSave(event) {
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
            new ShowToastEvent ({
                title: 'Success',
                message: 'Contact created Successfully...! '+' RecordId: '+event.detail.Id,
                variant: 'success', 
            })
        );
       
    }
}