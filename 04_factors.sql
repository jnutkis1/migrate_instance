DECLARE @ASSESSMENT_ID INT = 2124

DECLARE @FACTOR_OUTPUT TABLE (FACTOR_TYPE VARCHAR(MAX),SELECTION VARCHAR(MAX))
SELECT 'INSERT INTO @FACTOR_OUTPUT VALUES ('''+COALESCE(C.Name,'')+''','''+COALESCE(B.Selection,'')+''');'
FROM CSFAssessmentFactor A
JOIN Factor B ON B.Id = A.FactorId
JOIN FactorType C ON C.Id = B.FactorTypeId
WHERE
	A.CSFAssessmentId = @ASSESSMENT_ID

DECLARE @ASSESSMENT TABLE (Version VARCHAR(MAX), Name VARCHAR(MAX), Status INT, CSFAssessmentTypeCode VARCHAR(MAX), CSFAssessmentOptionTypeCode VARCHAR(MAX), RequireReportProcessing BIT, SubscriberSelectedAssessorId INT, AssessorId INT, ContactName VARCHAR(MAX), ContactTitle VARCHAR(MAX), ContactEmail VARCHAR(MAX), ContactPhone1 VARCHAR(MAX), ContactPhone2 VARCHAR(MAX), OrganizationName VARCHAR(MAX), OrganizationLocation VARCHAR(MAX), OrganizationAddress VARCHAR(MAX), OrganizationSummary VARCHAR(MAX), OrganizationNumberOfEmployees INT, EnvironmentDescription VARCHAR(MAX), EnvironmentOutsourced VARCHAR(MAX), DefaultMaturityTypeCodeImplemented INT, DefaultMaturityTypeCodeManaged INT, DefaultMaturityTypeCodeMeasured INT, DefaultMaturityTypeCodePolicy INT, DefaultMaturityTypeCodeProcess INT, Updated DATETIME, Created DATETIME, ReportCreditPending BIT, ClonedId INT, FinalReportDate DATE, DraftReportDate DATE, Certified BIT, Offline BIT, InterimParentCSFAssessmentId INT, AssessorScopeAgreement INT, AssessorBreachAgreement INT, Published BIT, QaCommentsGenerated BIT, DraftReportApproved BIT, AssessorExtensionAgreement INT, PostedDraftReportDate DATE, PostedFinalReportDate DATE, ForInterimCreationOnly BIT, Archived BIT, LitigationHold BIT, ArchivedDateTime DATETIME, DeletionDate DATE, InterimNotificationEmails VARCHAR(MAX), DraftReportComment VARCHAR(MAX), FinalReportComment VARCHAR(MAX), NISTCertified BIT, UserNameSubmittedToHITRUST VARCHAR(MAX))
SELECT 'INSERT INTO @ASSESSMENT VALUES ('+
''''+COALESCE(B.Name,'')+''''+','+
''''+COALESCE(A.Name,'')+''''+','+
''''+COALESCE(CAST(A.Status AS VARCHAR),'')+''''+','+
''''+COALESCE(CSFAssessmentTypeCode,'')+''''+','+
''''+COALESCE(CSFAssessmentOptionTypeCode,'')+''''+','+
''''+COALESCE(CAST(RequireReportProcessing AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(SubscriberSelectedAssessorId AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorId AS VARCHAR),'')+''''+','+
''''+COALESCE(ContactName,'')+''''+','+
''''+COALESCE(ContactTitle,'')+''''+','+
''''+COALESCE(ContactEmail,'')+''''+','+
''''+COALESCE(ContactPhone1,'')+''''+','+
''''+COALESCE(ContactPhone2,'')+''''+','+
''''+COALESCE(OrganizationName,'')+''''+','+
''''+COALESCE(OrganizationLocation,'')+''''+','+
''''+COALESCE(OrganizationAddress,'')+''''+','+
''''+COALESCE(OrganizationSummary,'')+''''+','+
''''+COALESCE(CAST(OrganizationNumberOfEmployees AS VARCHAR),'')+''''+','+
''''+COALESCE(EnvironmentDescription,'')+''''+','+
''''+COALESCE(EnvironmentOutsourced,'')+''''+','+
''''+COALESCE(CAST(DefaultMaturityTypeCodeImplemented AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(DefaultMaturityTypeCodeManaged AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(DefaultMaturityTypeCodeMeasured AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(DefaultMaturityTypeCodePolicy AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(DefaultMaturityTypeCodeProcess AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(Updated AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(A.Created AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(ReportCreditPending AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(ClonedId AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(FinalReportDate AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(DraftReportDate AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(Certified AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(Offline AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(InterimParentCSFAssessmentId AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorScopeAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorBreachAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(A.Published AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(QaCommentsGenerated AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(DraftReportApproved AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(AssessorExtensionAgreement AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(PostedDraftReportDate AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(PostedFinalReportDate AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(ForInterimCreationOnly AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(Archived AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(LitigationHold AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(ArchivedDateTime AS VARCHAR),'')+''''+','+
''''+COALESCE(CAST(DeletionDate AS VARCHAR),'')+''''+','+
''''+COALESCE(InterimNotificationEmails,'')+''''+','+
''''+COALESCE(DraftReportComment,'')+''''+','+
''''+COALESCE(FinalReportComment,'')+''''+','+
''''+COALESCE(CAST(NISTCertified AS VARCHAR),'')+''''+','+
''''+COALESCE(UserNameSubmittedToHITRUST,'')+''''+')'
FROM CSFAssessment A
JOIN MyCSF_LibraryVersion B ON B.VersionId = A.VersionId
WHERE
	A.Id = @ASSESSMENT_ID
	