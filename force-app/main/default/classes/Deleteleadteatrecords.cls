public class Deleteleadteatrecords {
	PUBLIC void deleteleaddml(){
        list<lead> leadlist = new list<lead>();
        leadlist = [SELECT Id,Name,LeadSource,Email FROM Lead where Email =null];
      
        delete leadlist;
       }
}