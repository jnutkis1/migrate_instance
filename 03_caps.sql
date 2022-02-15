DECLARE @ASSESSMENT_ID INT = 127

DECLARE @CAP_OUTPUT TABLE (ACCEPTRISK BIT,STATUS INT,POC VARCHAR(MAX),CAP VARCHAR(MAX),SCHEDULED DATETIME, PERONRESOURCE VARCHAR(MAX),FINANCIALRESOURCE VARCHAR(MAX),NUMMILE INT, DATE1 DATETIME,MILE1 VARCHAR(MAX) ,DATE2 DATETIME,MILE2 VARCHAR(MAX) ,DATE3 DATETIME,MILE3 VARCHAR(MAX) ,DATE4 DATETIME,MILE4 VARCHAR(MAX) ,DATE5 DATETIME,MILE5 VARCHAR(MAX),ACTUALDATE DATETIME,COMMENTS VARCHAR(MAX),EMAIL VARCHAR(MAX),NAME VARCHAR(MAX))
SELECT 'INSERT INTO @CAP_OUTPUT VALUES ('+COALESCE(CAST(A.AcceptRisk AS VARCHAR),'')+','+CAST(A.Status AS VARCHAR)+','''+COALESCE(A.PointOfContact,'')+''','''+COALESCE(REPLACE(A.CorrectiveAction,'''',''''''),'')+''','''+COALESCE(CAST(A.ScheduledCompletionDate AS VARCHAR),'')+''','''+COALESCE(A.RemediationPersonnelResourcesRequired,'')+''','''+COALESCE(A.RemediationFinancialResourcesRequired,'')+''','+COALESCE(CAST(A.NumberOfMilestones AS VARCHAR),'')+','''+COALESCE(CAST(MilestoneDate1 AS VARCHAR),'')+''','''+COALESCE(MilestoneName1,'')+''','''+COALESCE(CAST(MilestoneDate2 AS VARCHAR),'')+''','''+COALESCE(MilestoneName2,'')+''','''+ COALESCE(CAST(MilestoneDate3 AS VARCHAR),'')+''','''+COALESCE(MilestoneName3,'')+''','''+ COALESCE(CAST(MilestoneDate4 AS VARCHAR),'')+''','''+COALESCE(MilestoneName4,'')+''','''+ COALESCE(CAST(MilestoneDate5 AS VARCHAR),'')+''','''+COALESCE(MilestoneName5,'')+''','''+COALESCE(CAST(A.ActualCompletionDate AS VARCHAR),'')+''','''+COALESCE(A.Comments,'')+''','''+COALESCE(A.EmailAddresses,'')+''','''+COALESCE(REPLACE(A.Name,'''',''''''),'')+''');'
FROM CorrectiveActionPlan A
WHERE
	A.SubscriberId = (SELECT SubscriberId FROM CSFAssessment WHERE Id = @ASSESSMENT_ID)
	AND A.Status != 0

DECLARE @LINKED_CAPS TABLE (BUID VARCHAR(MAX), NAME VARCHAR(MAX),CAP VARCHAR(MAX))
SELECT 'INSERT INTO @LINKED_CAPS VALUES ('''+COALESCE(C.BaselineUniqueId,'')+''','''+COALESCE(REPLACE(D.Name,'''',''''''),'')+''','''+COALESCE(REPLACE(D.CorrectiveAction,'''',''''''),'')+''');'
FROM CSFAssessmentRequirement A
JOIN CSFAssessmentRequirementCorrectiveActionPlan B ON B.CSFAssessmentRequirementId = A.Id
JOIN CSFQuestionRequirement C ON C.Id = A.CSFQuestionRequirementId
JOIN CorrectiveActionPlan D ON D.Id = B.CorrectiveActionPlanId
WHERE
	A.CSFAssessmentId = @ASSESSMENT_ID
	