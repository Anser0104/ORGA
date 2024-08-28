public class demo_simpleinterest {
/*public integer principle=5000;
    public integer timeperiod=5;
    public integer rate=3;*/
    public integer output;
    //method with arguments
    /*public void display(integer principle,integer timeperiod,integer rate)
    {
        output =(principle*timeperiod*rate)/100;
        system.debug('output is'+output);
    }*/
    public demo_simpleinterest(integer principle,integer timeperiod,integer rate)
    {
       output =(principle*timeperiod*rate)/100;
        system.debug('output in constructor is '+output);
    }
}