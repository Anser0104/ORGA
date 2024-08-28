public class MarksCalculations {
 public integer S1 = 78;
 public integer S2 = 71;
 public integer S3 = 80;
 public integer S4 = 88;
 public integer S5 = 90;
 public integer Result;
    
   public void Total_Calculation()
   {
      integer Result = S1+S2+S3+S4+S5;
       system.debug('Total_Calculation: '+Result);
   }
    
    public void Average_Calculation()
   {
      double Result = (S1+S2+S3+S4+S5)/5;
       system.debug('Average_Calculation: '+Result);
   }
    
    public void Percentage_Calculation()
   {
     double Result = (S1+S2+S3+S4+S5)*100/500;
       system.debug('Percentage_Calculation: '+Result);
   }
}