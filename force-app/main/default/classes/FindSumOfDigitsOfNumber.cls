public class FindSumOfDigitsOfNumber {
 public void display(integer num, integer sum)
 {
    while(num>0)
    {
        sum = sum+math.mod(num,10);
         num = num/10;
    }
     
     system.debug('Final Sum of didgits of number '+sum);
 }
}