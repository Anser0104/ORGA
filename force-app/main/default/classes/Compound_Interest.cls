public class Compound_Interest {
 public double P=25000;
 public double T=3;
 public double R=5;
 public double CI;
 //public double result;
    
    public void CI()
    {
        CI = P*(Math.pow((1+R/100),T));
        system.debug('The Compound_Interest is '+CI);
    }
}