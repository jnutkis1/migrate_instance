DECLARE @ASSESSMENT_ID INT = 3623


DECLARE @DOCUMENT_OUTPUT TABLE (NAME VARCHAR(MAX),DESCRIPTION VARCHAR(MAX),DOCUMENT_ID INT)

SELECT DISTINCT
	'INSERT INTO @DOCUMENT_OUTPUT VALUES ('+
	''''+COALESCE(REPLACE(A.Name,'''',''''''),'')+''','''+
	COALESCE(REPLACE(A.Description,'''',''''''),'')+''','''+COALESCE(CAST(A.DocumentTypeId AS VARCHAR(MAX)),'')+''''+')'
FROM CSFAssessmentDocument A
JOIN DocumentType B ON B.Id = A.DocumentTypeId
WHERE
	A.CSFAssessmentId = @ASSESSMENT_ID
	AND A.DocumentTypeId IN (1,2)
	
DECLARE @DOCUMENTS_REQUIREMENTS TABLE (DOCUMENT VARCHAR(MAX),BUID VARCHAR(MAX),LINK_TYPE INT, POLICY BIT,PROCESS BIT,IMPLEMENTED BIT, MEASURED BIT, MANAGED BIT, OPORIND VARCHAR(10))

SELECT DISTINCT 'INSERT INTO @DOCUMENTS_REQUIREMENTS VALUES ('+
''''+COALESCE(REPLACE(A.Name,'''',''''''),'')+''',''' +COALESCE(D.BaselineUniqueId,'')+''','+CAST(COALESCE(B.SelectionTypeId,'') AS VARCHAR(25))
+','+COALESCE(CAST(B.MaturityPolicyRelated AS VARCHAR(10)),'')
+','+COALESCE(CAST(B.MaturityProcessRelated AS VARCHAR(10)),'')
+','+COALESCE(CAST(B.MaturityImplementedRelated AS VARCHAR(10)),'')
+','+COALESCE(CAST(B.MaturityMeasuredRelated AS VARCHAR(10)),'')
+','+COALESCE(CAST(B.MaturityManagedRelated AS VARCHAR(10)),'')
+','''+COALESCE(B.OperationalOrIndependent,'')
 +''')'
FROM CSFAssessmentDocument A
JOIN CSFAssessmentRequirementDocument B ON B.CSFAssessmentDocumentId = A.Id
JOIN CSFAssessmentRequirement C ON C.Id = B.CSFAssessmentRequirementId
JOIN CSFQuestionRequirement D ON D.Id = C.CSFQuestionRequirementId
WHERE
	A.CSFAssessmentId = @ASSESSMENT_ID
	AND C.InScope = 1
	