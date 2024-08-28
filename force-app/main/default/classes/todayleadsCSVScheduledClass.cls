global class todayleadsCSVScheduledClass implements Schedulable {
    global void execute(SchedulableContext SC){
        todayleadsCSVbatchClass batch = new todayleadsCSVbatchClass();
        Database.executeBatch(batch, 200);
    }
}