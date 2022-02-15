SET NOCOUNT ON

/*

READ: THIS SCRIPT NEEDS THE OUTPUTS FROM THE TWO QUERIES IN 04_factors

*/

--NECESSARY VARS
DECLARE @SUBSCRIBER INT = 1021
DECLARE @ASSESSMENT_ID INT



DECLARE @FACTOR_OUTPUT TABLE (FACTOR_TYPE VARCHAR(MAX),SELECTION VARCHAR(MAX))
DECLARE @ASSESSMENT TABLE (Version VARCHAR(MAX), Name VARCHAR(MAX), Status INT, CSFAssessmentTypeCode VARCHAR(MAX), CSFAssessmentOptionTypeCode VARCHAR(MAX), RequireReportProcessing BIT, SubscriberSelectedAssessorId INT, AssessorId INT, ContactName VARCHAR(MAX), ContactTitle VARCHAR(MAX), ContactEmail VARCHAR(MAX), ContactPhone1 VARCHAR(MAX), ContactPhone2 VARCHAR(MAX), OrganizationName VARCHAR(MAX), OrganizationLocation VARCHAR(MAX), OrganizationAddress VARCHAR(MAX), OrganizationSummary VARCHAR(MAX), OrganizationNumberOfEmployees INT, EnvironmentDescription VARCHAR(MAX), EnvironmentOutsourced VARCHAR(MAX), DefaultMaturityTypeCodeImplemented INT, DefaultMaturityTypeCodeManaged INT, DefaultMaturityTypeCodeMeasured INT, DefaultMaturityTypeCodePolicy INT, DefaultMaturityTypeCodeProcess INT, Updated DATETIME, Created DATETIME, ReportCreditPending BIT, ClonedId INT, FinalReportDate DATE, DraftReportDate DATE, Certified BIT, Offline BIT, InterimParentCSFAssessmentId INT, AssessorScopeAgreement INT, AssessorBreachAgreement INT, Published BIT, QaCommentsGenerated BIT, DraftReportApproved BIT, AssessorExtensionAgreement INT, PostedDraftReportDate DATE, PostedFinalReportDate DATE, ForInterimCreationOnly BIT, Archived BIT, LitigationHold BIT, ArchivedDateTime DATETIME, DeletionDate DATE, InterimNotificationEmails VARCHAR(MAX), DraftReportComment VARCHAR(MAX), FinalReportComment VARCHAR(MAX), NISTCertified BIT, UserNameSubmittedToHITRUST VARCHAR(MAX))

--INSERT FACTOR OUTPUT HERE
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Internet','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Third Party Accessible','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Third Party Exchange','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Public Access','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Number of interfaces','Fewer than 25');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Number of users of the system','Fewer than 500');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Number of transactions per day','Fewer than 6,750');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST Org New: Record Total','Less than 10 Million Records');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST Reg: Regulatory Factors','Subject to Banking Requirements');
INSERT INTO @FACTOR_OUTPUT VALUES ('Organization Type','Health Information Exchange (HIE)');
INSERT INTO @FACTOR_OUTPUT VALUES ('Entity Type','Healthcare - Business Associate');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST Org: Geographic Factors','Multi-State');
INSERT INTO @FACTOR_OUTPUT VALUES ('AllOrg','Applicable to all Organizations');
INSERT INTO @FACTOR_OUTPUT VALUES ('AllSys','Applicable to all systems');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Cloud Hosted','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: External Access','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Dial-Up','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Fax','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Travel','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Tokens','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: BYOD','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Wireless Access Points','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Development','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Goods Services','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Electronic Signatures','Yes');
INSERT INTO @FACTOR_OUTPUT VALUES ('HITRUST System: Courier','Yes');

--INSERT ASSESSMENT OUTPUT HERE
INSERT INTO @ASSESSMENT VALUES ('v9.1','05/08/2020','31','VALIDATED','SECURITYPRIVACY','1','0','788','05/08/2020','05/08/2020','123@gmail.com','4444','','eee','eee','rrr','rrr','333','rrr','rr','100','100','100','100','100','May 18 2020  1:26PM','May  8 2020 12:42PM','1','','','','0','1','','0','0','0','0','0','0','','','0','0','0','','','','','','0','')


--CREATE THE ASSESSMENT
IF NOT EXISTS (SELECT * FROM CSFAssessment A WHERE A.Name = (SELECT TOP 1 Name FROM @ASSESSMENT) AND A.SubscriberId = @SUBSCRIBER)
	BEGIN
		DECLARE @VERSION INT = (SELECT B.VersionId FROM @ASSESSMENT A JOIN MyCSF_LibraryVersion B ON B.Name = A.Version)
		DECLARE @NAME VARCHAR(500) = (SELECT TOP 1 Name FROM @ASSESSMENT)
		EXEC addAssessment @SUBSCRIBER,@VERSION,NULL,@NAME,0,0,0,'james,nutkis@hitrustalliance.net',NULL,@Id = @ASSESSMENT_ID OUTPUT
		PRINT 'ASSESSMENT '+ CAST(@ASSESSMENT_ID AS VARCHAR(200)) + ' CREATED'
	END
ELSE
	BEGIN
		SET @ASSESSMENT_ID = (SELECT A.Id FROM CSFAssessment A WHERE A.Name = (SELECT TOP 1 Name FROM @ASSESSMENT) AND A.SubscriberId = @SUBSCRIBER)
		PRINT 'ASSESSMENT '+ CAST(@ASSESSMENT_ID AS VARCHAR(200)) + ' SET'
	END
	
--SET PRE-ASSESSMENT NOW
UPDATE A
SET
	A.Status=B.Status,
	A.CSFAssessmentTypeCode=B.CSFAssessmentTypeCode,
	A.CSFAssessmentOptionTypeCode=B.CSFAssessmentOptionTypeCode,
	A.RequireReportProcessing=B.RequireReportProcessing,
	A.SubscriberSelectedAssessorId=B.SubscriberSelectedAssessorId,
	A.AssessorId=B.AssessorId,
	A.ContactName=B.ContactName,
	A.ContactTitle=B.ContactTitle,
	A.ContactEmail=B.ContactEmail,
	A.ContactPhone1=B.ContactPhone1,
	A.ContactPhone2=B.ContactPhone2,
	A.OrganizationName=B.OrganizationName,
	A.OrganizationLocation=B.OrganizationLocation,
	A.OrganizationAddress=B.OrganizationAddress,
	A.OrganizationSummary=B.OrganizationSummary,
	A.OrganizationNumberOfEmployees=B.OrganizationNumberOfEmployees,
	A.EnvironmentDescription=B.EnvironmentDescription,
	A.EnvironmentOutsourced=B.EnvironmentOutsourced,
	A.DefaultMaturityTypeCodeImplemented=B.DefaultMaturityTypeCodeImplemented,
	A.DefaultMaturityTypeCodeManaged=B.DefaultMaturityTypeCodeManaged,
	A.DefaultMaturityTypeCodeMeasured=B.DefaultMaturityTypeCodeMeasured,
	A.DefaultMaturityTypeCodePolicy=B.DefaultMaturityTypeCodePolicy,
	A.DefaultMaturityTypeCodeProcess=B.DefaultMaturityTypeCodeProcess,
	A.Updated=B.Updated,
	A.Created=B.Created,
	A.ReportCreditPending=B.ReportCreditPending,
	A.ClonedId=B.ClonedId,
	A.FinalReportDate=B.FinalReportDate,
	A.DraftReportDate=B.DraftReportDate,
	A.Certified=B.Certified,
	A.Offline=B.Offline,
	A.AssessorScopeAgreement=B.AssessorScopeAgreement,
	A.AssessorBreachAgreement=B.AssessorBreachAgreement,
	A.Published=B.Published,
	A.QaCommentsGenerated=B.QaCommentsGenerated,
	A.DraftReportApproved=B.DraftReportApproved,
	A.AssessorExtensionAgreement=B.AssessorExtensionAgreement,
	A.PostedDraftReportDate=B.PostedDraftReportDate,
	A.PostedFinalReportDate=B.PostedFinalReportDate,
	A.ForInterimCreationOnly=B.ForInterimCreationOnly,
	A.Archived=B.Archived,
	A.LitigationHold=B.LitigationHold,
	A.ArchivedDateTime=B.ArchivedDateTime,
	A.DeletionDate=B.DeletionDate,
	A.InterimNotificationEmails=B.InterimNotificationEmails,
	A.DraftReportComment=B.DraftReportComment,
	A.FinalReportComment=B.FinalReportComment,
	A.NISTCertified=B.NISTCertified,
	A.UserNameSubmittedToHITRUST=B.UserNameSubmittedToHITRUST
FROM CSFAssessment A
JOIN @ASSESSMENT B ON B.Name = A.Name
WHERE
	A.Id = @ASSESSMENT_ID
	
UPDATE A
SET
	A.ArchivedDateTime =
		CASE
			WHEN A.ArchivedDateTime = '1900-01-01' THEN NULL
			ELSE A.ArchivedDateTime
		END,
	A.FinalReportDate =
		CASE
			WHEN A.FinalReportDate = '1900-01-01' THEN NULL
			ELSE A.FinalReportDate
		END,
	A.DraftReportDate =
		CASE
			WHEN A.DraftReportDate = '1900-01-01' THEN NULL
			ELSE A.DraftReportDate
		END,
	A.PostedFinalReportDate =
		CASE
			WHEN A.PostedFinalReportDate = '1900-01-01' THEN NULL
			ELSE A.PostedFinalReportDate
		END,
	A.PostedDraftReportDate =
		CASE
			WHEN A.PostedDraftReportDate = '1900-01-01' THEN NULL
			ELSE A.PostedDraftReportDate
		END,
	A.DeletionDate =
		CASE
			WHEN A.DeletionDate = '1900-01-01' THEN NULL
			ELSE A.DeletionDate
		END
FROM CSFAssessment A
WHERE
	A.Id = @ASSESSMENT_ID

--SET FACTORS
DECLARE @FACTORS_TO_ADD TABLE (ID INT)
INSERT INTO @FACTORS_TO_ADD
	SELECT B.Id
	FROM @FACTOR_OUTPUT A
	JOIN Factor B ON B.Selection = A.SELECTION
	JOIN FactorType C ON C.Id = B.FactorTypeId AND C.Name = A.FACTOR_TYPE
	JOIN FactorCategory D ON D.VersionId = (SELECT VersionId FROM CSFAssessment WHERE Id = @ASSESSMENT_ID) AND D.Id = C.FactorCategoryId

INSERT INTO CSFAssessmentFactor	
	SELECT @ASSESSMENT_ID,B.ID,NULL,1
	FROM CSFAssessmentFactor A
	RIGHT JOIN @FACTORS_TO_ADD B ON B.ID = A.FactorId AND A.CSFAssessmentId = @ASSESSMENT_ID
	WHERE
		A.CSFAssessmentId IS NULL

