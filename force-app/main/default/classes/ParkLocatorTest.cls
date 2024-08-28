@isTest
private class ParkLocatorTest {
    @isTest static void Testcountry(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        string country = 'United States';
        list<string> ExpectedParks = new list<string>{'Yosemite', 'Seqouia', 'Crater Lake'};
        system.assertEquals(ExpectedParks, ParkLocator.country(country));
    }
  
}