global class DeletePastAccRecScheduleApex implements Schedulable {
   global void execute(SchedulableContext sc) {
           DeletePastAccRecBatchApex bahjob = new DeletePastAccRecBatchApex();
           Id jobId = Database.executeBatch(bahjob,200);
           system.debug('JobId==> '+jobId);
   }
}