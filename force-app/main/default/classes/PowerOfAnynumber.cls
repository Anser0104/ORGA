public class PowerOfAnynumber {
    public integer num = 6;
    public integer power = 5;
    public integer result = 1;
    
    public void display()
    {
        for(integer i = 0; i<5; i++)
        {
            result = result*num;
            system.debug('each iteration value ' +i + ' each result value ' +result);
           
        }
        system.debug ('The final ouput is: '+result);
    }

}