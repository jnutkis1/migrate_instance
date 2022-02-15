DECLARE @ASSESSMENT_ID INT = 3625

DECLARE @ASSESSMENT_OUTPUT TABLE (NotApplicable BIT, Comments VARCHAR(MAX), MaturityTypeCodeImplemented INT, MaturityTypeCodeManaged INT, MaturityTypeCodeMeasured INT, MaturityTypeCodePolicy INT, MaturityTypeCodeProcess INT, AssessorMaturityImplementedAgreement INT, AssessorMaturityManagedAgreement INT, AssessorMaturityMeasuredAgreement INT, AssessorMaturityPolicyAgreement INT, AssessorMaturityProcessAgreement INT, AssessorComments VARCHAR(MAX), Updated DATETIME, Status INT, QAComments VARCHAR(MAX), MaturityScore DECIMAL(20,2), GapIdentified BIT, CapRequired BIT, InterimSelection BIT, AssessorInterimAgreement INT, QAOverride BIT, AssessorNotApplicable BIT, AssessorMaturityTypeCodeImplemented INT, AssessorMaturityTypeCodeManaged INT, AssessorMaturityTypeCodeMeasured INT, AssessorMaturityTypeCodePolicy INT, AssessorMaturityTypeCodeProcess INT, BaselineUniqueId VARCHAR(MAX))
SELECT DISTINCT
'INSERT INTO @ASSESSMENT_OUTPUT VALUES ('+
''''+COALESCE(CAST(NotApplicable AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(REPLACE(Comments,'''','''''') AS VARCHAR(MAX)),'')+''''+','+
''''+COALESCE(CAST(MaturityTypeCodeImplemented AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(MaturityTypeCodeManaged AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(MaturityTypeCodeMeasured AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(MaturityTypeCodePolicy AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(MaturityTypeCodeProcess AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityImplementedAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityManagedAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityMeasuredAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityPolicyAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityProcessAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(REPLACE(AssessorComments,'''','''''') AS VARCHAR(MAX)),'')+''''+','+
''''+COALESCE(CAST(A.Updated AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(Status AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(REPLACE(QAComments,'''','''''') AS VARCHAR(MAX)),'')+''''+','+
''''+COALESCE(CAST(MaturityScore AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(GapIdentified AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(CapRequired AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(InterimSelection AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorInterimAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(QAOverride AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorNotApplicable AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityTypeCodeImplemented AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityTypeCodeManaged AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityTypeCodeMeasured AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityTypeCodePolicy AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorMaturityTypeCodeProcess AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(BaselineUniqueId AS VARCHAR(MAX)),'')+''''+')'


FROM CSFAssessmentRequirement A
JOIN CSFQuestionRequirement B ON B.Id = A.CSFQuestionRequirementId
WHERE
	A.CSFAssessmentId = @ASSESSMENT_ID
	AND A.InScope = 1
