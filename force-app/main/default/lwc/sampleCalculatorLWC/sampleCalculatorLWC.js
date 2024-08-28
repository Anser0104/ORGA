import { LightningElement } from 'lwc';
export default class SampleCalculatorLWC extends LightningElement {
    number1;
    number2;
    handleChangeEvent(event)
        {
            const val = event.target.value;
            const name = event.target.name;
            if(name == 'number1'){
            this.number1 = val;
            }else{
            this.number2 = val;
            }
        }
            handleAdd(){
            const sum= parseInt(this.number1)+parseInt(this.number2);
            alert(sum);
            }
            handleSubc(){
            const subc = parseInt(this.number1)-parseInt(this.number2);
            alert(subc);
            }
            handleMulti(){
            const sum= parseInt(this.number1)*parseInt(this.number2);
            alert(sum);
            }
            handleDivision(){
            const sum= parseInt(this.number1)/parseInt(this.number2);
            alert(sum);
            }
}