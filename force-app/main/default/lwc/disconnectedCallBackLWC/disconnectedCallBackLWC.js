import { LightningElement } from 'lwc';
export default class DisconnectedCallBackLWC extends LightningElement {
    showHide = 'false';

    handleClick(){
            this.showHide = this.showHide?false:true;
    }
}