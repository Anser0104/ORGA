@ISTEST	
public class QueriesExample_TEST {
	public static testmethod void verifydata()
    {
		Account acc = new Account();
        acc.Name ='test Account name';
        acc.Industry ='Banking';
        insert acc;
        
        Contact cnct = new Contact();
        cnct.LastName ='test contact';
        insert cnct;
        
        QueriesExample a  = new QueriesExample();
        a.soqlEX();
  
    }
}