SET NOCOUNT ON

/*

READ: THIS SCRIPT NEEDS THE OUTPUTS FROM THE 05_assessment

*/

--NECESSARY VARS
DECLARE @ASSESSMENT_ID INT = 1727

DECLARE @ASSESSMENT_OUTPUT TABLE (NotApplicable BIT, Comments VARCHAR(MAX), MaturityTypeCodeImplemented INT, MaturityTypeCodeManaged INT, MaturityTypeCodeMeasured INT, MaturityTypeCodePolicy INT, MaturityTypeCodeProcess INT, AssessorMaturityImplementedAgreement INT, AssessorMaturityManagedAgreement INT, AssessorMaturityMeasuredAgreement INT, AssessorMaturityPolicyAgreement INT, AssessorMaturityProcessAgreement INT, AssessorComments VARCHAR(MAX), Updated DATETIME, Status INT, QAComments VARCHAR(MAX), MaturityScore DECIMAL(20,2), GapIdentified BIT, CapRequired BIT, InterimSelection BIT, AssessorInterimAgreement INT, QAOverride BIT, AssessorNotApplicable BIT, AssessorMaturityTypeCodeImplemented INT, AssessorMaturityTypeCodeManaged INT, AssessorMaturityTypeCodeMeasured INT, AssessorMaturityTypeCodePolicy INT, AssessorMaturityTypeCodeProcess INT, BaselineUniqueId VARCHAR(MAX))

-- INSERT STATEMENT OUTPUT


INSERT INTO CSFAssessmentRequirement (
		CSFAssessmentId
      ,CSFQuestionRequirementId
      ,NotApplicable
      ,InScope
      ,Comments
      ,MaturityTypeCodeImplemented
      ,MaturityTypeCodeManaged
      ,MaturityTypeCodeMeasured
      ,MaturityTypeCodePolicy
      ,MaturityTypeCodeProcess
      ,AssessorMaturityImplementedAgreement
      ,AssessorMaturityManagedAgreement
      ,AssessorMaturityMeasuredAgreement
      ,AssessorMaturityPolicyAgreement
      ,AssessorMaturityProcessAgreement
      ,AssessorComments
      ,RemediationStatusFactorId
      ,Updated
      ,Status
      ,QAComments
      ,MaturityScore
      ,GapIdentified
      ,CapRequired
      ,InterimSelection
      ,AssessorInterimAgreement
      ,QAOverride
      ,AssessorNotApplicable
      ,AssessorMaturityTypeCodeImplemented
      ,AssessorMaturityTypeCodeManaged
      ,AssessorMaturityTypeCodeMeasured
      ,AssessorMaturityTypeCodePolicy
      ,AssessorMaturityTypeCodeProcess
      ,OfflineRulesLastProcessed
      ,InternalAssessorComments
      ,TestedByInternalAssessor
      ,ExternalAssessorReliedOnInternalAssessor
      ,Deleted
      ,ChangedByUserName
      ,AssignedUsers
      ,ChangeDescription
      ,BridgeSelection
      ,AssessorCapReviewAgreement
      ,AssessorCapComments
      ,RiskBasedQaSelection
      ,InScopeDate
      ,CapRequiredDate
      ,SubscriberSelection
      ,MetaDITA
      ,MetaSamplingPopulation
      ,MetaSampleItems
      ,MetaNeverNA
      ,MetaNeverNAReason
      ,MetaUpdated
      ,QAComplete
)
	SELECT @ASSESSMENT_ID,B.Id,A.NotApplicable,1,A.Comments,A.MaturityTypeCodeImplemented,A.MaturityTypeCodeManaged,A.MaturityTypeCodeMeasured,A.MaturityTypeCodePolicy,A.MaturityTypeCodeProcess,A.AssessorMaturityImplementedAgreement,A.AssessorMaturityManagedAgreement,A.AssessorMaturityMeasuredAgreement,A.AssessorMaturityPolicyAgreement,A.AssessorMaturityProcessAgreement,A.AssessorComments,NULL,GETDATE(),A.Status,A.QAComments,A.MaturityScore,A.GapIdentified,A.CapRequired,A.InterimSelection,0,A.QAOverride,A.AssessorNotApplicable,A.AssessorMaturityTypeCodeImplemented,A.AssessorMaturityTypeCodeManaged,A.AssessorMaturityTypeCodeMeasured,A.AssessorMaturityTypeCodePolicy,A.AssessorMaturityTypeCodeProcess,NULL,NULL,0,0,0,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL
	FROM @ASSESSMENT_OUTPUT A
	JOIN CSFQuestionRequirement B ON B.BaselineUniqueId = A.BaselineUniqueId
	--JOIN CSFAssessmentDomain C ON C.Id = B.CSFAssessmentDomainId AND C.VersionId = (SELECT A.VersionId FROM CSFAssessment A WHERE A.Id = @ASSESSMENT_ID)