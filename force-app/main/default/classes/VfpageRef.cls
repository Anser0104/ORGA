public class VfpageRef {
  ApexPages.standardController m_sc = null;
  public VfpageRef(ApexPages.standardController sc)
  {
    m_sc = sc;
  }
    public Pagereference saveAndNew()
  {
    SObject so = m_sc.getRecord();
    upsert so;
    string s = '/' + ('' + so.get('Id')).subString(0, 3) + '/e?';
    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.Info, s));
    return new Pagereference(s);
  }
}