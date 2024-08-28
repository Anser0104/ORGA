public class stringArrayTest{
	public static List<string> generateStringArray(integer n){
		List<string> namelist = new List<string>();
		for(integer i=0;i<n;i++){
		namelist.add('Test '+i);
		}
        system.debug('namelist : '+namelist);
		return namelist;
	}
}