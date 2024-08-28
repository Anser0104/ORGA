import { LightningElement, track } from 'lwc';

export default class MyFirstWebComponent extends LightningElement {
    @track
          contacts = [
            {
                id:1,
                Name:'Amy Taylor',
                Title: 'VP of Engineering',
            },
            {
                id:2,
                Name:'Michael Jones',
                Title: 'VP of Sales',
            },
            {
                id:3,
                Name:'Jennifer Wu',
                Title: 'CEO',
            },
          ];
}