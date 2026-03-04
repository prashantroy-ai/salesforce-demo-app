@isTest
private class ProjectServiceTest {

    @isTest
    static void testUpdateProjectStatus() {

        Project__c proj = new Project__c(
            Name = 'Test Project',
            Status__c = 'Not Started',
            Description__c = 'Kickoff meeting scheduled'
        );

        insert proj;

        Test.startTest();
        ProjectService.updateProjectStatus(new List<Id>{proj.Id});
        Test.stopTest();

        Project__c updatedProj = [
            SELECT Status__c
            FROM Project__c
            WHERE Id = :proj.Id
        ];

        System.assertEquals('In Progress', updatedProj.Status__c);
    }
}