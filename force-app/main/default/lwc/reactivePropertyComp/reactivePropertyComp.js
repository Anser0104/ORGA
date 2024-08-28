import { LightningElement, track, api } from 'lwc';

export default class ReactivePropertyComp extends LightningElement {
    @track message1 ='Track message';
    @api message2 ='Api message';

    onchangeHandler(event){
        this.message1 = event.target.value;
        console.log('From tarck', this.message1);
    }
    onchange2(event){
        this.message2 = event.target.value;
        console.log('From Api', this.message2);
    }
}