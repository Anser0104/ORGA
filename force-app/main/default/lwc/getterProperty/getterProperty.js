import { api, LightningElement } from 'lwc';

export default class GetterProperty extends LightningElement {
    @api message1= 'Default msg from JS';

    handleChange(event){
                this.message1 = event.target.value;
                console.log('updated msg', this.message1);
    }
    get name(){
        return 'Nossam Anser basha';
    }

    get modifyedMessage1(){
        return this.message1+' modified Message using get Property'
    }
    connectedCallback() {
       console.log('Hello ConnectedCallBack called');
    }
    disconnectedCallback() {
        console.log('Hello disconnectedCallback called');
    }
}