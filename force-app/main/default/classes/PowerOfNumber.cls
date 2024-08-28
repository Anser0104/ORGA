public class PowerOfNumber {
	public void display(integer base, integer exponential,integer power)
    {
        
        for(integer i = 1; i<=exponential; i++)
        {
            power = power*base;
        }
        system.debug('Final output of power of number is by for loop '+power);
    }
    
    public void display1(integer base, integer exponential,integer power)
    {
        while (exponential>0 )
        {
            power = power*base;
            exponential--;
        }
         system.debug('Final output of power of number is by while loop '+power);
    }
    //a.display(2,3,1);
	//a.display1(2,3,1);
}