trigger MovieNameChangeonMovieObj on Movie__c (AFTER Update) {
    if(MovienameChangeTriggerRecurssive.fireTriggeratOnceonMovieObj==true){
        MovienameChangeTriggerRecurssive.fireTriggeratOnceonMovieObj=false;
        
        list<Director__c> directorobjlistToUpdate = new list<Director__c>();
        map<Id, String> DirectorIdMovieMap = new map<Id, String>();
        for(Movie__c mv:trigger.new){
            DirectorIdMovieMap.put(mv.Director__c, mv.Movie_Name__c);
        }
        if(DirectorIdMovieMap.size()>0){
            for(Id mvids:DirectorIdMovieMap.keySet())
            {
                Director__c dirt = new Director__c();
                dirt.Id = mvids;
                dirt.Movie_Name__c = DirectorIdMovieMap.get(mvids);
                directorobjlistToUpdate.add(dirt);
            }
            update directorobjlistToUpdate;
        }
    }
    
}