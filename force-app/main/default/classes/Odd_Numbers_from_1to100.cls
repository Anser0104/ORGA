public class Odd_Numbers_from_1to100 {
    public void display(integer n)
    {
        for(integer i=1; i<=n; i++)
        {
            if(Math.mod(i,2)!=0)
            {
             system.debug('This is a Odd number ' +i);   
            }
        }
    }
}