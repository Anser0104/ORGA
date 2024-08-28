import { LightningElement } from 'lwc';

export default class RegistrationForm extends LightningElement {

    firstValue;
    secondValue;
    Result;
    changeHandler(event){
        var inputValue = event.target.name;
        if(inputValue==='firstValue'){
            this.firstValue = event.target.value;
        }
        else{
            this.secondValue = event.target.value;
        }
    }
    addition(){
        var input1 =this.firstValue;
        var input2 =this.secondValue;
        var output = parseInt(input1)+parseInt(input2);
        this.Result = output;
    }
    subtraction(){
        var input1 =this.firstValue;
        var input2 =this.secondValue;
        var output = parseInt(input1)-parseInt(input2);
        this.Result = output;
    }
    multiplication(){
        var input1 =this.firstValue;
        var input2 =this.secondValue;
        var output = parseInt(input1)*parseInt(input2);
        this.Result = output;
    }
    division(){
        var input1 =this.firstValue;
        var input2 =this.secondValue;
        var output = parseInt(input1)/parseInt(input2);
        this.Result = output;
    }
}