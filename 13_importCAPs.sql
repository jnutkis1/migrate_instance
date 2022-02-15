SET NOCOUNT ON

/*

READ: THIS SCRIPT NEEDS THE OUTPUTS FROM THE 03_caps

*/

--NECESSARY VARS
DECLARE @SUBSCRIBER INT = 1028
DECLARE @ASSESSMENT_ID INT = 1727

DECLARE @CAP_OUTPUT TABLE (ACCEPTRISK BIT,STATUS INT,POC VARCHAR(MAX),CAP VARCHAR(MAX),SCHEDULED DATETIME, PERONRESOURCE VARCHAR(MAX),FINANCIALRESOURCE VARCHAR(MAX),NUMMILE INT, DATE1 DATETIME,MILE1 VARCHAR(MAX) ,DATE2 DATETIME,MILE2 VARCHAR(MAX) ,DATE3 DATETIME,MILE3 VARCHAR(MAX) ,DATE4 DATETIME,MILE4 VARCHAR(MAX) ,DATE5 DATETIME,MILE5 VARCHAR(MAX),ACTUALDATE DATETIME,COMMENTS VARCHAR(MAX),EMAIL VARCHAR(MAX),NAME VARCHAR(MAX))
DECLARE @LINKED_CAPS TABLE (BUID VARCHAR(MAX), NAME VARCHAR(MAX),CAP VARCHAR(MAX))

-- INSERT CAP OUTPUT
INSERT INTO @CAP_OUTPUT VALUES (0,2,'Chirag Panchal (ISO) / Anjan Yaragani','DocASAP Inc. would update its enterprise DLP solution to prohibit execution of mobile codes and will update group policy and firewall settings to ensure malicious mobile codes are not executed.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Restriction of Mobile code execution (such as Java, JavaScript, ActiveX, PDF, postscript, Shockwave movies, and Flash animations)');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DocASAP Inc. would implement restriction to save data on workstation. 
Idle session timeout and screen lockout would be configured.

Users would be trained to lock their workstations when they are moving away from their workstations. 

DocASAP would require users to collect printouts as soon as they are printed.
 
Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Updating and Implementation of clear desk policy');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','Procedures would be updated to mandate logging of each VPN session (success and failures) and detailed procedure on assigning, reconciliation and revocation of VPN access. VPN authentication to use, unique username and multi-factor authentication. All action (success, failures and attempts) taken on core devices (network devices, security devices, servers and application and databases) would be logged and sent to centralised logging and monitoring solution and will be actively monitored.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','VPN encryption and logging');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Aayush Sharma','DOCASAP Inc. will update Group Policy to allow only workstations registered with the Domain Controller (node authentication) will be allowed to login to the scoped environment/network and will use Microsoft Windows authentication protocols.','2023-05-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Node Authentication');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO)','DocASAP Inc. will mandate logging of all access requests for non-organizational users (physician office, clinics etc.) and will assign a unique identifier (ticket number) and will process the request post due approvals and same will be updated on the ticket.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Access provision and revocation for non-organizational users');
INSERT INTO @CAP_OUTPUT VALUES (0,2,'Chirag Panchal (ISO) / Anjan Yaragani','DocASAP Inc. will imply one time password as a multi-factor parameter to authenticate system hosting ePHI data.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.','2023-05-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Replay-resistant authentication mechanisms for privileged account');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Aayush Sharma','DOCASAP Inc. will implemented PKI based authentication for all web-based/application systems. Also, DOCASAP Inc. will ensure that certificate is valid and issued by an appropriate authority.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','PKI-based authentication');
INSERT INTO @CAP_OUTPUT VALUES (0,2,'Chirag Panchal (ISO)','DocASAP Inc. will imply access restriction to users so that non-administrative users will not have access to write scripts and/or macros.
they will only have access to pre-defined menu options.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Access to application functions');
INSERT INTO @CAP_OUTPUT VALUES (0,2,'Chirag Panchal (ISO)','DocASAP Inc. will imply restriction to ensure that any requests sent to the application will only reflect the output on the system/terminal from where the request is triggered.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Application Outputs sent only to authorized terminals/locations');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DocASAP Inc. would update its enterprise DLP solution to prohibit unauthorised access/sharing of sensitive information. Also, group policies would be updated and implemented to prohibit move, copy, transfer and print of sensitive information.
Further all access and access attempts to sensitive information would be logged and sent to central logging and monitoring solution and all anomalies would be logged and investigated.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Access restriction and movement of sensitive information');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Aayush Sharma','DocASAP Inc. would log all access (logical and physical) revocation requests (voluntary and involuntary) including those of business associates and would process the same on priority basis (within 24 hours).
Also, where required the user would be escorted out of the business premises by security personnals.

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Access revocation for employee and business associates');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO)','DocASAP Inc. would mandate its employees and business associates to share acknowledgement and agreement that they will follow DocASAP Inc.''s information security, privacy and acceptable usage policy.
Any violation or breach would attract punitive action inline to DocASAP Inc.''s information security and zero tolerance policy.

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Acceptable use agreements');
INSERT INTO @CAP_OUTPUT VALUES (0,2,'Chirag Panchal (ISO) / Anjan Yaragani','DocASAP Inc. will implement Login banners at all systems login screen.

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Login Banners with terms and conditions of access');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will implement Login banners at all systems login screen. 

Also, training modules will be updated to include the notice as well.

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Employee consent for monitoring');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO)','DOCASAP Inc.would conduct quarterly tests to test its  monitoring and detection processes and will document the outcome''s learnings and deficiencies and will update its procedures to improve efficencies in the procedure. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Testing of monitoring and detection process');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Aggregation of information from multiple sources');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Monitoring of events');
INSERT INTO @CAP_OUTPUT VALUES (0,2,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomalies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Monitoring of events of privileged accounts');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. with the help of OEM will configure its SIEM solution to generate reports and will also configure alerts parameters to flag anomolies for audit reduction.

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Auditing and monitoring systems');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will configure all devices, Servers, application and databases to send their (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored by security team and all anomalies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Log analysis');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will configure all devices including firewalls, devices, servers, applications and database to send their (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomolies will be logged and investigated. 

Also, File Intergrity Monitoring tool will be configured to send its logs to  to the central logging and monitoring solution and will be actively monitored by security team and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Monitoring of inbound and outbound traffic');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will configure IPS on external interfaces and all logs (Success, Failure and Attempts) to the  central logging and monitoring Solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','IPS/IDS to manage network administration activities');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO) / Anjan Yaragani','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring Solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Separation of duties');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO)','DOCASAP Inc. will structure Security and Information Security team to be independent vertical with its own reporting structure and escalation matrix and will be lead be member(s) of Sr. Management.

Relevant policy, procedure and org structure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Independent Security Veriticals');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO)','DOCASAP Inc. will perform periodic Access Reconcilation and Access Review to prevent any Unauthorized access or access misuse.

Also, DOCASAP Inc. will ensure that requester/process is different from approver. 

Relevant policy, procedure and org structure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Separation of duties');
INSERT INTO @CAP_OUTPUT VALUES (0,1,'Chirag Panchal (ISO)','DOCASAP Inc. will perform periodic Access Reconcilation and Access Review to prevent any Unauthorized access or access misuse.

Also, DOCASAP Inc. will ensure separation of duties for developer and administrator, General users etc. and requester/process is different from approver. 

Relevant policy, procedure and org structure would be updated, approved and implied.','2022-12-30','','',0,'3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','3000-12-31','','','Separation of duties');

-- INSERT LINKED CAPS
INSERT INTO @LINKED_CAPS VALUES ('0225.09k1Organizational.1','Restriction of Mobile code execution (such as Java, JavaScript, ActiveX, PDF, postscript, Shockwave movies, and Flash animations)','DocASAP Inc. would update its enterprise DLP solution to prohibit execution of mobile codes and will update group policy and firewall settings to ensure malicious mobile codes are not executed.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.');
INSERT INTO @LINKED_CAPS VALUES ('1114.01h1Organizational.123','Updating and Implementation of clear desk policy','DocASAP Inc. would implement restriction to save data on workstation. 
Idle session timeout and screen lockout would be configured.

Users would be trained to lock their workstations when they are moving away from their workstations. 

DocASAP would require users to collect printouts as soon as they are printed.
 
Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.');
INSERT INTO @LINKED_CAPS VALUES ('1118.01j2Organizational.124','VPN encryption and logging','Procedures would be updated to mandate logging of each VPN session (success and failures) and detailed procedure on assigning, reconciliation and revocation of VPN access. VPN authentication to use, unique username and multi-factor authentication. All action (success, failures and attempts) taken on core devices (network devices, security devices, servers and application and databases) would be logged and sent to centralised logging and monitoring solution and will be actively monitored.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.');
INSERT INTO @LINKED_CAPS VALUES ('1178.01j2Organizational.7','Node Authentication','DOCASAP Inc. will update Group Policy to allow only workstations registered with the Domain Controller (node authentication) will be allowed to login to the scoped environment/network and will use Microsoft Windows authentication protocols.');
INSERT INTO @LINKED_CAPS VALUES ('11110.01q1Organizational.6','Access provision and revocation for non-organizational users','DocASAP Inc. will mandate logging of all access requests for non-organizational users (physician office, clinics etc.) and will assign a unique identifier (ticket number) and will process the request post due approvals and same will be updated on the ticket.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.');
INSERT INTO @LINKED_CAPS VALUES ('11112.01q2Organizational.67','Replay-resistant authentication mechanisms for privileged account','DocASAP Inc. will imply one time password as a multi-factor parameter to authenticate system hosting ePHI data.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.');
INSERT INTO @LINKED_CAPS VALUES ('11111.01q2System.4','PKI-based authentication','DOCASAP Inc. will implemented PKI based authentication for all web-based/application systems. Also, DOCASAP Inc. will ensure that certificate is valid and issued by an appropriate authority.');
INSERT INTO @LINKED_CAPS VALUES ('1129.01v1System.12','Access to application functions','DocASAP Inc. will imply access restriction to users so that non-administrative users will not have access to write scripts and/or macros.
they will only have access to pre-defined menu options.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated');
INSERT INTO @LINKED_CAPS VALUES ('1131.01v2System.2','Application Outputs sent only to authorized terminals/locations','DocASAP Inc. will imply restriction to ensure that any requests sent to the application will only reflect the output on the system/terminal from where the request is triggered.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated');
INSERT INTO @LINKED_CAPS VALUES ('1134.01v3System.1','Access restriction and movement of sensitive information','DocASAP Inc. would update its enterprise DLP solution to prohibit unauthorised access/sharing of sensitive information. Also, group policies would be updated and implemented to prohibit move, copy, transfer and print of sensitive information.
Further all access and access attempts to sensitive information would be logged and sent to central logging and monitoring solution and all anomalies would be logged and investigated.

Relevant policy and procedure would be updated, approved and implied. Employee trainings would be provided to ensure they are updated.');
INSERT INTO @LINKED_CAPS VALUES ('1136.02i2Organizational.1','Access revocation for employee and business associates','DocASAP Inc. would log all access (logical and physical) revocation requests (voluntary and involuntary) including those of business associates and would process the same on priority basis (within 24 hours).
Also, where required the user would be escorted out of the business premises by security personnals.

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1137.06e1Organizational.1','Acceptable use agreements','DocASAP Inc. would mandate its employees and business associates to share acknowledgement and agreement that they will follow DocASAP Inc.''s information security, privacy and acceptable usage policy.
Any violation or breach would attract punitive action inline to DocASAP Inc.''s information security and zero tolerance policy.

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1138.06e2Organizational.12','Login Banners with terms and conditions of access','DocASAP Inc. will implement Login banners at all systems login screen.

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1201.06e1Organizational.2','Employee consent for monitoring','DOCASAP Inc. will implement Login banners at all systems login screen. 

Also, training modules will be updated to include the notice as well.

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('12102.09ab1Organizational.4','Testing of monitoring and detection process','DOCASAP Inc.would conduct quarterly tests to test its  monitoring and detection processes and will document the outcome''s learnings and deficiencies and will update its procedures to improve efficencies in the procedure. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('12103.09ab1Organizational.5','Aggregation of information from multiple sources','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1213.09ab2System.128','Monitoring of events','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1214.09ab2System.3456','Monitoring of events of privileged accounts','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomalies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1215.09ab2System.7','Auditing and monitoring systems','DOCASAP Inc. with the help of OEM will configure its SIEM solution to generate reports and will also configure alerts parameters to flag anomolies for audit reduction.

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1217.09ab3System.3','Log analysis','DOCASAP Inc. will configure all devices, Servers, application and databases to send their (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored by security team and all anomalies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1220.09ab3System.56','Monitoring of inbound and outbound traffic','DOCASAP Inc. will configure all devices including firewalls, devices, servers, applications and database to send their (with Success, Failure and Attempts) logs to the central logging and monitoring solution and will be actively monitored and all anomolies will be logged and investigated. 

Also, File Intergrity Monitoring tool will be configured to send its logs to  to the central logging and monitoring solution and will be actively monitored by security team and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1271.09ad2System.1','IPS/IDS to manage network administration activities','DOCASAP Inc. will configure IPS on external interfaces and all logs (Success, Failure and Attempts) to the  central logging and monitoring Solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1230.09c2Organizational.1','Separation of duties','DOCASAP Inc. will configure all devices, Servers, application and databases to send their CURD (with Success, Failure and Attempts) logs to the central logging and monitoring Solution and will be actively monitored and all anomolies will be logged and investigated. 

Relevant policy and procedure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1276.09c2Organizational.2','Independent Security Veriticals','DOCASAP Inc. will structure Security and Information Security team to be independent vertical with its own reporting structure and escalation matrix and will be lead be member(s) of Sr. Management.

Relevant policy, procedure and org structure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1277.09c2Organizational.4','Separation of duties','DOCASAP Inc. will perform periodic Access Reconcilation and Access Review to prevent any Unauthorized access or access misuse.

Also, DOCASAP Inc. will ensure that requester/process is different from approver. 

Relevant policy, procedure and org structure would be updated, approved and implied.');
INSERT INTO @LINKED_CAPS VALUES ('1278.09c2Organizational.56','Separation of duties','DOCASAP Inc. will perform periodic Access Reconcilation and Access Review to prevent any Unauthorized access or access misuse.

Also, DOCASAP Inc. will ensure separation of duties for developer and administrator, General users etc. and requester/process is different from approver. 

Relevant policy, procedure and org structure would be updated, approved and implied.');

-- IMPORT CAPS INTO SUBSCRIBER
	INSERT INTO CorrectiveActionPlan (
			ClonedId
      ,SubscriberId
      ,AcceptRisk
      ,Status
      ,PointOfContact
      ,CorrectiveAction
      ,ScheduledCompletionDate
      ,RemediationPersonnelResourcesRequired
      ,RemediationFinancialResourcesRequired
      ,NumberOfMilestones
      ,MilestoneName1
      ,MilestoneDate1
      ,MilestoneName2
      ,MilestoneDate2
      ,MilestoneName3
      ,MilestoneDate3
      ,MilestoneName4
      ,MilestoneDate4
      ,MilestoneName5
      ,MilestoneDate5
      ,ActualCompletionDate
      ,Comments
      ,EmailAddresses
      ,Updated
      ,Name
      ,UpdatedBy)
	SELECT  NULL,@SUBSCRIBER,A.ACCEPTRISK,A.STATUS,A.POC,A.CAP,A.SCHEDULED,A.PERONRESOURCE,A.FINANCIALRESOURCE,A.NUMMILE,A.MILE1,A.DATE1,A.MILE2,A.DATE2,A.MILE3,A.DATE3,A.MILE4,A.DATE4,A.MILE5,A.DATE5,A.ACTUALDATE,A.COMMENTS,A.EMAIL,GETDATE(),A.NAME,NULL
	FROM @CAP_OUTPUT A
	LEFT JOIN CorrectiveActionPlan B ON B.Name = A.NAME AND B.SubscriberId = @SUBSCRIBER
	WHERE
		B.Id IS NULL



-- LINK CAPS TO STATEMENTS
INSERT INTO CSFAssessmentRequirementCorrectiveActionPlan
	SELECT DISTINCT E.Id,D.Id
	FROM @LINKED_CAPS A
	JOIN CSFQuestionRequirement B ON B.BaselineUniqueId = A.BUID
	JOIN CSFAssessmentDomain C ON C.Id = B.CSFAssessmentDomainId AND C.VersionId = (SELECT VersionId FROM CSFAssessment WHERE Id = @ASSESSMENT_ID)
	JOIN CorrectiveActionPlan D ON D.Name = A.NAME AND D.CorrectiveAction = A.CAP AND D.SubscriberId = @SUBSCRIBER
	JOIN CSFAssessmentRequirement E ON E.CSFQuestionRequirementId = B.Id
	LEFT JOIN CSFAssessmentRequirementCorrectiveActionPlan F ON F.CorrectiveActionPlanId = D.Id AND E.Id = F.CSFAssessmentRequirementId
	WHERE
		E.CSFAssessmentId = @ASSESSMENT_ID
		AND F.CorrectiveActionPlanId IS NULL

