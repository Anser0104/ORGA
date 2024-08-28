public class listMethod {
public void Studentslist()
 {
   list <string> students = new list <string>();
    students.add('Anser');
    students.add('Kishore');
    students.add('Ranga');
    students.add('Jagadesh');
    students.add('Vijai'); 
    system.debug ('list before sort is==>' +students);
    students.sort();
    system.debug ('list after sort is==>' +students);
    system.debug('students list is '+students);
     
     list <string> newstudents = new list <string>();
     newstudents.add('khadeer');
     newstudents.add('Athaulla');
     system.debug('newstudents list is '+newstudents);
      students.addAll(newstudents);
     system.debug('students + newstudents is '+students);
    system.debug('3rd student is '+students.get(3));
     system.debug('0th student is '+students.get(0));
     system.debug('4th student is '+students.get(4));
     system.debug('2nd student is '+students.get(2));
     system.debug('1st student is '+students.get(1));
     system.debug('5th student is '+students.get(5));
     system.debug('6th student is '+students.get(6));
     system.debug('Removed student is '+students.remove(4));
      system.debug('students list after removing is '+students);
      system.debug('vijai is their in list '+students.contains('vijai'));
     system.debug('Anser is their in list '+students.contains('Anser'));
     system.debug('Ranga is their in list '+students.contains('Ranga'));
 }
}