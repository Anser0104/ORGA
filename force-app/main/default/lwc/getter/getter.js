import { LightningElement } from 'lwc';

export default class Getter extends LightningElement {
    firstName ='';
    lastName ='';
    changHandler(event){
       const inputField = event.target.name;
       if(inputField ==='firstName'){
        this.firstName = event.target.value;
       }
       else{
        this.lastName=event.target.value;
       }
    }
    get FullName() {
        return `${this.firstName} ${this.lastName}`;
    }
}