DECLARE @ASSESSMENT_ID INT = 3625

DECLARE @SYSTEMS_OUTPUT TABLE (NAME VARCHAR(MAX),APPLICATION VARCHAR(MAX),PLATFORM VARCHAR(MAX),OS VARCHAR(MAX),DBS VARCHAR(MAX), PRIOR VARCHAR(MAX),DESCRIPTION VARCHAR(MAX),COMMENTS VARCHAR(MAX),INACTIVE BIT,LOCATION VARCHAR(MAX))
SELECT DISTINCT 'INSERT INTO @SYSTEMS_OUTPUT VALUES ('''+A.Name+''','''+A.Application+''','''+A.Platform++''','''+A.OperatingSystem+''','''+A.Databases+''','''+A.SystemPriorAssessment+''','''+COALESCE(REPLACE(A.Description,'''',''''''),'')+''','''+COALESCE(REPLACE(A.Comments,'''',''''''),'')+''','+CAST(A.Inactive AS VARCHAR(MAX))+','''+A.Location+''');'
FROM Systems A
WHERE
	A.SubscriberId = (SELECT B.SubscriberId FROM CSFAssessment B WHERE B.Id = @ASSESSMENT_ID)
	
DECLARE @LINKED_SYSTEMS TABLE (NAME VARCHAR(MAX))
SELECT DISTINCT 'INSERT INTO @LINKED_SYSTEMS VALUES ('''+B.Name+''');'
FROM CSFAssessmentSystems A
JOIN Systems B ON B.Id = A.SystemsId
WHERE
	A.CSFAssessmentId = @ASSESSMENT_ID