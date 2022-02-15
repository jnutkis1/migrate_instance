SET NOCOUNT ON

/*

READ: THIS SCRIPT NEEDS THE OUTPUTS FROM THE 01_facilities and 02_systems

*/

--NECESSARY VARS
DECLARE @SUBSCRIBER INT = 1021
DECLARE @ASSESSMENT_ID INT = 2175



DECLARE @FACILITY_OUTPUT TABLE (NAME VARCHAR(MAX),STREETADDRESS VARCHAR(MAX),CITY VARCHAR(MAX),COUNTRY_ID INT,STATEPROVINCE VARCHAR(MAX),ZIP VARCHAR(MAX),FACILITYYPE INT,DESCRIPTION VARCHAR(MAX),COMMENTS VARCHAR(MAX),INACTIVE BIT)
DECLARE @LINKED_FACILITIES TABLE (NAME VARCHAR(MAX))
DECLARE @SYSTEMS_OUTPUT TABLE (NAME VARCHAR(MAX),APPLICATION VARCHAR(MAX),PLATFORM VARCHAR(MAX),OS VARCHAR(MAX),DBS VARCHAR(MAX), PRIOR VARCHAR(MAX),DESCRIPTION VARCHAR(MAX),COMMENTS VARCHAR(MAX),INACTIVE BIT,LOCATION VARCHAR(MAX))
DECLARE @LINKED_SYSTEMS TABLE (NAME VARCHAR(MAX))

--INSERT FACILITY OUTPUT FOR SUBSCRIBER
INSERT INTO @FACILITY_OUTPUT VALUES ('Facility 1','101 E. Park Blvd','Plano',12,'TX','75246','1','office','no comments',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('DE Facility 1','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('umyuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('nmuymyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('uymuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('ujmyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('mujmyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('uymyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyjmuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('nunyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('muymuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('fcrefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('freferfe','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('ferfrefe','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('gfrgrefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('grgeger','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('creece','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('gtrgg','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('htyhty','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('nn','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyjyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jmuyjmy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('nuynyuu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('muyjuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyjyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('mnujymyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES (',ikuk','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('kiukiu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('ver','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('rfe','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juykmuiy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('kiukiu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('rgefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('mujy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('m,im,y','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('mium,y','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('fre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('rererer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('grtger','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyj','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('kiykiy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('muy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('mumuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juykuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('htyjyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('nuyjmyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('muiymky','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('miumkiy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('myumyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyjyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frfre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefrefre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frfre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('freere','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('rgetre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('grge','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('greget','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('gfrger','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('fgtrgert','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frfgre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frf','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('mkiyky','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juiku','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jukyukyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jukuy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juymyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juymuymy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('ujymuymu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juymyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jujuym','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juuyjy','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jujyumyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyj','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juj','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('juyjut','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jhyujt','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jhuj','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('hytjtu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jyujty','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('hyjt','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('jyujyu','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('gtrgt','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frfer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frf','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frfer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefr','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefe','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frgeg','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frfer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefer','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('vrf','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('fre','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('fref','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefrs','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('frefr','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('gfd','','',12,'','','6','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);
INSERT INTO @FACILITY_OUTPUT VALUES ('JC Facility1','','Frisco',12,'','','4','','',0);

--INSERT LINKED FACILITIES
INSERT INTO @LINKED_FACILITIES VALUES ('Facility 1');
INSERT INTO @LINKED_FACILITIES VALUES ('DE Facility 1');

--INSERT SYSTEMS
INSERT INTO @SYSTEMS_OUTPUT VALUES ('System 2','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('System 1','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('System 3','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('James System','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('Sales System','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('Sales System 2','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('ffhdj`','fhnrjfh','grfjg','fjvgnhjfgq','gvfjgn','vjfnj','vjfnfj','vbfjnvf',0,'vbfjnv');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('DE System 1','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('System A','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('Test System','','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('asdw','d','','','','','','',0,'');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');
INSERT INTO @SYSTEMS_OUTPUT VALUES ('JC System1','App1','JC Platform','Windows','','','','',0,'Texas');

-- INSERT LINKED SYSTEMS
INSERT INTO @LINKED_SYSTEMS VALUES ('DE System 1');

-- ADD FACILITIES TO ORG
INSERT INTO Facility
	SELECT @SUBSCRIBER,A.NAME,A.STREETADDRESS,A.CITY,A.COUNTRY_ID,A.STATEPROVINCE,A.ZIP,A.FACILITYYPE,A.DESCRIPTION,A.COMMENTS,A.INACTIVE,GETDATE(),0,NULL,NULL
	FROM @FACILITY_OUTPUT A
	LEFT JOIN Facility B ON B.Name = A.NAME AND B.SubscriberId = @SUBSCRIBER
	WHERE
		B.Id IS NULL
		
-- ADD SYSTEMS TO ORG
INSERT INTO Systems
	SELECT 
		@SUBSCRIBER,A.NAME,A.APPLICATION,A.PLATFORM,A.OS,A.DBS,A.PRIOR,A.DESCRIPTION,A.COMMENTS,A.INACTIVE,GETDATE(),A.LOCATION,NULL,NULL
	FROM @SYSTEMS_OUTPUT A
	LEFT JOIN Systems B ON B.Name = A.NAME AND B.SubscriberId = @SUBSCRIBER
	WHERE
		B.Id IS NULL
		
-- NOW LINK FACILITY TO ASSESSMENT
INSERT INTO CSFAssessmentFacility
	SELECT @ASSESSMENT_ID,B.Id
	FROM @LINKED_FACILITIES A
	JOIN Facility B ON B.Name = A.NAME AND B.SubscriberId = @SUBSCRIBER
	LEFT JOIN CSFAssessmentFacility C ON C.CSFAssessmentId = @ASSESSMENT_ID AND C.FacilityId = B.Id
	WHERE
		C.CSFAssessmentId IS NULL
		
-- NOW LINK SYSTEM TO ASSESSMENT
INSERT INTO CSFAssessmentSystems
	SELECT @ASSESSMENT_ID,B.Id
	FROM @LINKED_SYSTEMS A
	JOIN Systems B ON B.Name = A.NAME AND B.SubscriberId = @SUBSCRIBER
	LEFT JOIN CSFAssessmentSystems C ON C.CSFAssessmentId = @ASSESSMENT_ID AND C.SystemsId = B.Id
	WHERE
		C.CSFAssessmentId IS NULL