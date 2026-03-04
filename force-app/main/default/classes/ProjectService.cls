public with sharing class ProjectService {

    public static void updateProjectStatus(List<Id> projectIds) {

        List<Project__c> projectsToUpdate = new List<Project__c>();

        for (Project__c proj : [
            SELECT Id, Status__c, Description__c
            FROM Project__c
            WHERE Id IN :projectIds
        ]) {

            if (!String.isBlank(proj.Description__c) &&
                proj.Status__c == 'Not Started') {

                proj.Status__c = 'In Progress';
                projectsToUpdate.add(proj);
            }
        }

        if (!projectsToUpdate.isEmpty()) {
            update projectsToUpdate;
        }
    }
}