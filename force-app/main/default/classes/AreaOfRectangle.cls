public class AreaOfRectangle {
 public integer length = 60;
 public integer breadth = 35;
 public integer area;
 public integer perimeter;
    
  public void Area()
  {
     area = length*breadth;
      system.debug('Area of rectangle is '+area);
  }
  public void perimeter()
  {
     perimeter = 2*(length+breadth);
      system.debug('perimeter of rectange is '+perimeter);
  }
    
}