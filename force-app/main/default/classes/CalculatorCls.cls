public class CalculatorCls {

    @AuraEnabled
    public static Integer calculate(string buttonName, integer firstNumber, integer secondNumber)
    {
        integer res = 0;
        if(buttonName=='Add'){
            res = firstNumber+secondNumber;
        }else if(buttonName=='Substract'){
            res = firstNumber-secondNumber;
        }else if(buttonName=='Multiply'){
            res = firstNumber*secondNumber;
        }else if(buttonName=='Divide'){
            res = firstNumber/secondNumber;
        }
        return res;
    }
}