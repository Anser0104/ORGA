public class AddPrimaryContact implements Queueable {
	private Contact c;
    private string state;
    public AddPrimaryContact(Contact c,string state){
        this.c =c;
        this.state= state;
    }
    public void execute(QueueableContext context){
        List<Account> acclist= [SELECT Id,Name,(SELECT Id,FirstName, LastName FROM Contacts)
                                FROM Account WHERE Billingstate=:state LIMIT 200];
        LIST<Contact> conlst = new list<Contact>();
        for(Account acc:acclist){
            Contact con = c.clone(false,false,false,false);
            con.AccountId=acc.Id;
            conlst.add(con);
        }
        if(conlst.size()>0){
            insert conlst;
        }
    }
}