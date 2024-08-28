trigger MovieNameChangeonDirectorobj on Director__c (after update) {
    if(MovienameChangeTriggerRecurssive.fireTriggeratOnceonDirectorObj == true){
        MovienameChangeTriggerRecurssive.fireTriggeratOnceonDirectorObj = false;
        list<Movie__c> moviesListToUpdate = new list<Movie__c>();
        for(Movie__c mvn:[select id, Director__r.Movie_Name__c from Movie__c where Director__c IN:trigger.newMap.Keyset()])
        {
            mvn.Movie_Name__c = mvn.Director__r.Movie_Name__c;
            moviesListToUpdate.add(mvn);
        }
        update moviesListToUpdate;
    }
    
}