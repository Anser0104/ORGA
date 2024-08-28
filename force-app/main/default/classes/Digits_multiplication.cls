public class Digits_multiplication {
public void display(integer num, integer result)
 {
    while(num>0)
    {
        result = result*math.mod(num,10);
         num = num/10;
    }
     system.debug('Multiplication of didgits of number is '+result);
 }
}