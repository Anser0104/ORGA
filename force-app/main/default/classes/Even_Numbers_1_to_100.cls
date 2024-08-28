public class Even_Numbers_1_to_100 {
    public void display(integer n)
    {
        for(integer i=1; i<=n; i++)
        {
            if(Math.mod(i,2)==0)
            {
             system.debug('This is a Even number ' +i);   
            }
        }
    }
}