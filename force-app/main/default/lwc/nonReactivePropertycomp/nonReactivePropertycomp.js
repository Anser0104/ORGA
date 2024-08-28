import { LightningElement } from 'lwc';

export default class NonReactivePropertycomp extends LightningElement {
    message = 'Non-Reactive Property';
   message1 = 'Reactive Property';

    onchangeHandler()
    {
             this.message = 'Updated to non reactive Property';
             console.log('Updated Message is ', this.message);
    }

    onchange2(event)
    {
        this.message1 = event.target.value;
        console.log('Updated Message is : ', this.message1);
    }
}