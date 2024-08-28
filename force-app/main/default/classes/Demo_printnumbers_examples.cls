public class Demo_printnumbers_examples {
    
   public void display()
   {
       for(integer i=1 ;i<=75; i++)
       {
           system.debug('the output is: '+i);
             if( math.mod(i,2) == 0)
              {
               system.debug('even num is '+i);
              }
              else
               {
                system.debug('odd num is '+i); 
               }
      }
      
   }
   
}