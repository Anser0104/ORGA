public class Arithamatic_Operations {
  public integer radius = 25;
  public integer result;
    
    public void diameter()
    {
        result = 2*radius;
        system.debug('The diameter is '+result);
    }
	public void circumference()
    {
        result = 2*4*radius;
        system.debug('The circumference is '+result);
    }
    
    public void area()
    {
        result = 4*radius*radius;
        system.debug('The area is '+result);
    }
}