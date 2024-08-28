public class Count_didgits_of_Anynumber {
public void display(integer num, integer sum, integer count )
 {
    while(num>0)
    {
        sum   = sum+math.mod(num,10);
        count++;
        num   = num/10;
    }
     
     system.debug('Count of didgits of number is '+count);
 }
}