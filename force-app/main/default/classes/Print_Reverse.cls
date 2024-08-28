public class Print_Reverse {
public void display(integer num, integer result, integer reverse)
 {
    while(num>0)
    {
        result = math.mod(num,10);
         reverse = reverse *10 + result;
         num = num/10;
        system.debug('Reverse of the number is '+reverse);
    }
     system.debug('Reverse of a given number is '+reverse);
     //initial reverse is = 0;
 }
}