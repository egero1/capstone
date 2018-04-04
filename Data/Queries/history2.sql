SELECT 
	src.Survey_Event_ID,
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID, Survey_Event_ID FROM src_Survey_Findings) AS src ON
src.Survey_Event_ID = stds.Survey_Event_ID
where src.Survey_Event_ID = 38759833;
SELECT 
	src.Survey_Event_ID,
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID, Survey_Event_ID FROM src_Survey_Findings) AS src ON
src.Survey_Event_ID = stds.Survey_Event_ID
where Survey_Event_ID = 38759833;
SELECT 
	src.Survey_Event_ID,
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID, Survey_Event_ID FROM src_Survey_Findings) AS src ON
src.Survey_Event_ID = stds.Survey_Event_ID;
SELECT 
Survey_Event_ID,
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID, Survey_Event_ID FROM src_Survey_Findings) AS src ON
src.Survey_Event_ID = stds.Survey_Event_ID;
SELECT 
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID, Survey_Event_ID FROM src_Survey_Findings) AS src ON
src.Survey_Event_ID = stds.Survey_Event_ID;
SELECT 
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID FROM src_Survey_Findings) AS src ON
src.Survey_Event_ID = stds.Survey_Event_ID;
SELECT 
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID FROM src_Survey_Findings) AS src ON
src.Standard__Event_ID = stds.Standard_Event_ID;
SELECT 
    src.Standard_ID,   
    LENGTH(src.Standard_ID) - LENGTH(REPLACE(stds.standards, src.Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID FROM src_Survey_Event) AS src ON
src.Standard__Event_ID = stds.Standard_Event_ID;
SELECT 
    Standard_ID,   
    LENGTH(Standard_ID) - LENGTH(REPLACE(standards, Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID FROM src_Survey_Event) AS src ON
src.Standard__Event_ID = stds.Standard_Event_ID;
SELECT 
    Standard_ID,   
    LENGTH(Standard_ID) - LENGTH(REPLACE(standards, Standard_ID, "1234")) 
        AS Count    
FROM Standards_Occ stds JOIN (SELECT DISTINCT Standard_ID FROM src_Survey_Event) AS src ON
src.Standard_ID = stds.Standard_ID;
SELECT 
    Standard_ID,   
    LENGTH(Standard_ID) - LENGTH(REPLACE(standards, Standard_ID, "1234")) 
        AS Count    
FROM Standards stds JOIN (SELECT DISTINCT Standard_ID FROM src_Survey_Event) AS src ON
src.Standard_ID = stds.Standard_ID;
CREATE TABLE Standards_Occ AS
SELECT Survey_Event_ID, GROUP_CONCAT(distinct Standard_ID SEPARATOR ', ') AS Standards
FROM src_Survey_Findings GROUP BY Survey_Event_ID;
SELECT 
    Standard_ID,   
    LENGTH(Standard_ID) - LENGTH( REPLACE ( Standard_ID, Standard_ID, "1234") ) 
        AS count    
FROM Standards;
CREATE TABLE Standards AS
SELECT Survey_Event_ID, GROUP_CONCAT(distinct Standard_ID SEPARATOR ', ') AS standards
FROM src_Survey_Findings GROUP BY Survey_Event_ID;
CREATE FUNCTION count_str(haystack TEXT, needle VARCHAR(32))
  RETURNS INTEGER DETERMINISTIC
  BEGIN
    RETURN ROUND((CHAR_LENGTH(haystack) - CHAR_LENGTH(REPLACE(haystack, needle, ''))) / CHAR_LENGTH(needle));
CREATE FUNCTION count_str(haystack TEXT, needle VARCHAR(32))
  RETURNS INTEGER DETERMINISTIC
  BEGIN
    RETURN ROUND((CHAR_LENGTH(haystack) - CHAR_LENGTH(REPLACE(haystack, needle, ""))) / CHAR_LENGTH(needle));
create table standards as
SELECT Survey_Event_ID, GROUP_CONCAT(distinct Standard_ID SEPARATOR ', ')
FROM src_Survey_Findings GROUP BY Survey_Event_ID;
SELECT Survey_Event_ID, GROUP_CONCAT(distinct Standard_ID SEPARATOR ', ')
FROM src_Survey_Findings GROUP BY Survey_Event_ID;
SELECT Survey_Event_ID, GROUP_CONCAT(Standard_ID SEPARATOR ', ')
FROM src_Survey_Findings GROUP BY Survey_Event_ID;
SELECT Survey_Event_ID, GROUP_CONCAT(Survey_Event_ID, Standard_ID SEPARATOR ', ')
FROM src_Survey_Findings GROUP BY Survey_Event_ID;
SELECT Survey_Event_ID, GROUP_CONCAT(select distinct Survey_Event_ID, Standard_ID SEPARATOR ', ')
FROM src_Survey_Findings GROUP BY Survey_Event_ID;
select distinct Survey_Event_ID, Standard_ID from src_Survey_Findings
order by 1, 2;
select distinct Survey_Event_ID, Standard_ID from src_Survey_Findings
order by 1;
select Survey_Event_ID, Standard_ID from src_Survey_Findings
order by 1;
select Survey_Event_ID, distinct Standard_ID from src_Survey_Findings
order by 1;
select Survey_Event_ID, Standard_ID from src_Survey_Findings
group by 1
order by 1;
select distinct Survey_Event_ID, Standard_ID from src_Survey_Findings
group by 1
order by 1;
select distinct Survey_Event_ID, Standard_ID from src_Survey_Findings
group by 1;
select distinct Survey_Event_Program_ID, Standard_ID from src_Survey_Findings
group by 1;
select distinct Standard_ID, Survey_Event_Program_ID  from src_Survey_Findings
group by 1;
select distinct Standard_ID, Survey_Event_Program_ID  from src_Survey_Findings
group by 2;
select distinct Standard_ID from src_Survey_Findings;
select distinct Standard_ID from src_Survey_Event;
select Main_Site_ID, Site from src_Survey_Event;
UPDATE src_Survey_Event
SET src_Survey_Event.Site = 
( 
SELECT Main_Site_ID FROM src_Survey_Findings
WHERE src_Survey_Findings.Survey_Event_Program_ID = src_Survey_Event.Survey_Event_Program_ID LIMIT 1
);
UPDATE src_Survey_Event
INNER JOIN
src_Survey_Findings
ON src_Survey_Event.Survey_Event_ID = src_Survey_Findings.Survey_Event_ID
SET src_Survey_Event.Site = src_Survey_Findings.Main_Site_ID;
select count(distinct Main_Site_ID) from src_Main_Sites;
CREATE TABLE Findings_Rollup AS
	SELECT main.Main_Site_ID
		,event.Survey_Event_Type
	,event.Survey_Decision
	#,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
		
	#	,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	#,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
		#,main.Hospital_Type
		,main.Number_of_Program_Sites
		,main.Number_of_DSC_Certifications
		,main.Number_of_NonDSC_Certifications
		,main.Volume_Year
		,main.Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites main
	JOIN (SELECT DISTINCT * FROM src_Survey_Event) event ON main.Main_Site_ID = event.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
CREATE TABLE Findins_Rollup AS
	SELECT main.Main_Site_ID
		,event.Survey_Event_Type
	,event.Survey_Decision
	#,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
		
	#	,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	#,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
		#,main.Hospital_Type
		,main.Number_of_Program_Sites
		,main.Number_of_DSC_Certifications
		,main.Number_of_NonDSC_Certifications
		,main.Volume_Year
		,main.Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites main
	JOIN (SELECT DISTINCT * FROM src_Survey_Event) event ON main.Main_Site_ID = event.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
CREATE TABLE Findins_Rollup AS
	SELECT main.Main_Site_ID
		,event.Survey_Event_Type
	,event.Survey_Decision
	#,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
		
	#	,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	#,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
		,main.Hospital_Type
		,main.Number_of_Program_Sites
		,main.Number_of_DSC_Certifications
		,main.Number_of_NonDSC_Certifications
		,main.Volume_Year
		,main.Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites main
	JOIN (SELECT DISTINCT * FROM src_Survey_Event) event ON main.Main_Site_ID = event.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
select distinct EP_ID from src_Survey_Findings where Main_Site_ID = 16947;
select distinct Standard_Label from src_Survey_Findings where Main_Site_ID = 16947;
select distinct Standard_Label from src_Survey_Findings;
select distinct Standard_Chapter_Code from src_Survey_Findings;
/*
Select findings.Survey_Event_ID
	,findings.Survey_Event_Program_ID
	,event.Survey_Event_Type
	,event.Survey_Decision
	,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,findings.Site_ID
	,main.Number_of_Program_Sites
	,mile_info.Miles_from_Main_Site
	,main.Academic
	,main.Acute_Care
	,main.Addiction_Opiod
	,main.Addictions
	,main.Hosp_Spec_Cardiac
	,main.Spec_Cardiac
	,main.Hosp_Children
	,main.Spec_Children
	,main.Eating
	,main.General
	,main.Hosp_LT_Acute_Care
	,main.LT_Acute_Care_Hosp
	,main.Mental_Health
	,main.Hosp_Oncology
	,main.Oncology_Spec
	,main.Hosp_Orthopedic
	,main.Spec_Orthopedic
	,main.Out_Hosp_Emer
	,main.Out_Hosp_Gen
	,main.Psychiatric
	,main.Hosp_Rehabilitation
	,main.Physical_Rehabilitation
	,main.Rehabilitation_Med
	,main.Hosp_Surgical
	,main.Spec_Surgical
	,main.Swing
	,main.Teaching
	,main.Census_20
	,main.Census_100
	,main.Census_500
	,main.Census_GT_500
	,main.Beds_20
	,main.Beds_100
	,main.Beds_500
	,main.Beds_GT_500
	,main.Visits_5000
	,main.Visits_20000
	,main.Visits_60000
	,main.Visits_GT_60000
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (

select count(distinct Main_Site_ID) from src_Main_Sites
*/
	SELECT main.Main_Site_ID
		,event.Survey_Event_Type
	,event.Survey_Decision
	#,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
		
	#	,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	#,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
		,main.Hospital_Type
		,main.Number_of_Program_Sites
		,main.Number_of_DSC_Certifications
		,main.Number_of_NonDSC_Certifications
		,main.Volume_Year
		,main.Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites main
	JOIN (SELECT DISTINCT * FROM src_Survey_Event) event ON main.Main_Site_ID = event.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites
	
/*	
	) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type

*/;
SELECT main.Main_Site_ID
		,event.Survey_Event_Type
	,event.Survey_Decision
	#,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
		
	#	,findings.Survey_Begin_Date
	#,findings.Survey_End_Date
	#,findings.Survey_Year
	#,findings.Main_Site_ID
	#,event.Program
	#,findings.Program_Code
	#,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	#,findings.SAFER_Scope
	#,findings.SAFER_Likelihood
		,main.Hospital_Type
		,main.Number_of_Program_Sites
		,main.Number_of_DSC_Certifications
		,main.Number_of_NonDSC_Certifications
		,main.Volume_Year
		,main.Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites main
	JOIN (SELECT DISTINCT src_Survey_Event) event ON main.Main_Site_ID = event.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
SELECT
		main.Main_Site_ID
		,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	#,event.Program
	,findings.Program_Code
	,findings.Program_Type
	#,findings.Standard_Chapter_Code
	#,findings.Standard_Chapter_Name
	#,findings.Standard_ID
	#,findings.Standard_Label
	#,findings.EP_ID
	#,findings.EP_Label
	#,findings.Standard_and_EP_Label
	#,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
		,main.Hospital_Type
		,main.Number_of_Program_Sites
		,main.Number_of_DSC_Certifications
		,main.Number_of_NonDSC_Certifications
		,main.Volume_Year
		,main.Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites main
	JOIN src_Survey_Findings findings ON main.Main_Site_ID = findings.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
select distinct Main_Site_ID from src_Main_Sites;
SELECT
		main.Main_Site_ID
		,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	#,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites main
	JOIN src_Survey_Findings findings ON main.Main_Site_ID = findings.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
SELECT
		main.Main_Site_ID
		,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	#,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites
	JOIN src_Survey_Findings findings ON main.Main_Site_ID = findings.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
SELECT
		main.Main_Site_ID
		,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	#,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites
	JOIN src_SurveyFindings findings ON main.Main_Site_ID = findings.Main_Site_ID
	GROUP BY main.Main_Site_ID, main.Number_of_Program_Sites;
SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM src_Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM Main_Sites;
select min(Survey_Begin_Date) from Survey;
select min(Survey_Begin_Date) from survey;
SELECT DISTINCT * FROM Survey_Findings;
CREATE TABLE survey AS
Select findings.Survey_Event_ID
	,findings.Survey_Event_Program_ID
	,event.Survey_Event_Type
	,event.Survey_Decision
	,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,findings.Site_ID
	,main.Number_of_Program_Sites
	,mile_info.Miles_from_Main_Site
	,main.Academic
	,main.Acute_Care
	,main.Addiction_Opiod
	,main.Addictions
	,main.Hosp_Spec_Cardiac
	,main.Spec_Cardiac
	,main.Hosp_Children
	,main.Spec_Children
	,main.Eating
	,main.General
	,main.Hosp_LT_Acute_Care
	,main.LT_Acute_Care_Hosp
	,main.Mental_Health
	,main.Hosp_Oncology
	,main.Oncology_Spec
	,main.Hosp_Orthopedic
	,main.Spec_Orthopedic
	,main.Out_Hosp_Emer
	,main.Out_Hosp_Gen
	,main.Psychiatric
	,main.Hosp_Rehabilitation
	,main.Physical_Rehabilitation
	,main.Rehabilitation_Med
	,main.Hosp_Surgical
	,main.Spec_Surgical
	,main.Swing
	,main.Teaching
	,main.Census_20
	,main.Census_100
	,main.Census_500
	,main.Census_GT_500
	,main.Beds_20
	,main.Beds_100
	,main.Beds_500
	,main.Beds_GT_500
	,main.Visits_5000
	,main.Visits_20000
	,main.Visits_60000
	,main.Visits_GT_60000
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
CREATE TABLE survey AS
Select findings.Survey_Event_ID
	,findings.Survey_Event_Program_ID
	,event.Survey_Event_Type
	,event.Survey_Decision
	,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,findings.Site_ID
	,main.Number_of_Program_Sites
	,mile_info.Miles_from_Main_Site
	,main.Academic
	,main.Acute_Care
	,main.Addiction_Opiod
	,main.Addictions
	,main.Hosp_Spec_Cardiac
	,main.Spec_Cardiac
	,main.Hosp_Children
	,main.Spec_Children
	,main.Eating
	,main.General
	,main.Hosp_LT_Acute_Care
	,main.LT_Acute_Care_Hosp
	,main.Mental_Health
	,main.Hosp_Oncology
	,main.Oncology_Spec
	,main.Hosp_Orthopedic
	,main.Spec_Orthopedic
	,main.Out_Hosp_Emer
	,main.Out_Hosp_Gen
	,main.Psychiatric
	,main.Hosp_Rehabilitation
	,main.Physical_Rehabilitation
	,main.Rehabilitation_Med
	,main.Hosp_Surgical
	,main.Spec_Surgical
	,main.Swing
	,main.Teaching
	,main.Census_20
	,main.Census_100
	,main.Census_500
	,main.Census_GT_500
	,main.Beds_20
	,main.Beds_100
	,main.Beds_500
	,main.Beds_GT_500
	,main.Visits_5000
	,main.Visits_20000
	,main.Visits_60000
	,main.Visits_GT_60000	,main.Hosp_Spec_Cardiac 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
CREATE TABLE survey AS
Select findings.Survey_Event_ID
	,findings.Survey_Event_Program_ID
	,event.Survey_Event_Type
	,event.Survey_Decision
	,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,findings.Site_ID
	,main.Number_of_Program_Sites
	,mile_info.Miles_from_Main_Site
	,main.Academic
	,main.Acute_Care
	,main.Addiction_Opiod
	,main.Addictions
	,main.Hosp_Spec_Cardiac
	,main.Spec_Cardiac
	,main.Hosp_Children
	,main.Spec_Children
	,main.Eating
	,main.General
	,main.Hosp_LT_Acute_Care
	,main.LT_Acute_Care_Hosp
	,main.Mental_Health
	,main.Hosp_Oncology
	,main.Oncology_Spec
	,main.Hosp_Orthopedic
	,main.Spec_Orthopedic
	,main.Out_Hosp_Emer
	,main.Out_Hosp_Gen
	,main.Psychiatric
	,main.Hosp_Rehabilitation
	,main.Physical_Rehabilita
	,main.Rehabilitation_Med
	,main.Hosp_Surgical
	,main.Spec_Surgical
	,main.Swing
	,main.Teaching
	,main.Census_20
	,main.Census_100
	,main.Census_500
	,main.Census_GT_500
	,main.Beds_20
	,main.Beds_100
	,main.Beds_500
	,main.Beds_GT_500
	,main.Visits_5000
	,main.Visits_20000
	,main.Visits_60000
	,main.Visits_GT_60000	,main.Hosp_Spec_Cardiac 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
select * from survey;
CREATE TABLE survey AS
Select findings.Survey_Event_ID
	,findings.Survey_Event_Program_ID
	,event.Survey_Event_Type
	,event.Survey_Decision
	,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,findings.Site_ID
	,main.Number_of_Program_Sites
	,mile_info.Miles_from_Main_Site 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 		,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites;
CREATE TABLE survey AS
Select findings.Survey_Event_ID
	,findings.Survey_Event_Program_ID
	,event.Survey_Event_Type
	,event.Survey_Decision
	,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,findings.Site_ID
	,main.Number_of_Program_Sites
	,mile_info.Miles_from_Main_Site 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 		,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 		,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 		,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 		,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 		,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 		,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 		,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 		,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 		,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 		,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 		,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,SUM(CASE WHEN Average_Daily_Census > 500 THEN 1 ELSE 0 END) AS Census_GT_500
 	,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,SUM(CASE WHEN Beds > 500 THEN 1 ELSE 0 END) AS Beds_GT_500
 	,SUM(CASE WHEN Visits < 5000 THEN 1 ELSE 0 END) AS Visits_5000
 	,SUM(CASE WHEN Visits > 5001 AND Visits <= 20000 THEN 1 ELSE 0 END) AS Visits_20000
 	,SUM(CASE WHEN Visits >= 20001 AND Visits <= 60000 THEN 1 ELSE 0 END) AS Visits_60000
 	,SUM(CASE WHEN Visits > 60000 THEN 1 ELSE 0 END) AS Visits_GT_60000
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,SUM(CASE WHEN Average_Daily_Census > 501 THEN 1 ELSE 0 END) AS Census_GT_500
 	,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,SUM(CASE WHEN Beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
 	,SUM(CASE WHEN Visits < 21 THEN 1 ELSE 0 END) AS Visits_20
 	,SUM(CASE WHEN Visits > 20 AND Visits <= 100 THEN 1 ELSE 0 END) AS Visits_100
 	,SUM(CASE WHEN Visits >= 101 AND Visits <= 500 THEN 1 ELSE 0 END) AS Visits_500
 	,SUM(CASE WHEN Visits > 501 THEN 1 ELSE 0 END) AS Visits_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,SUM(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,SUM(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,SUM(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,SUM(CASE WHEN Average_Daily_Census > 501 THEN 1 ELSE 0 END) AS Census_GT_500
 	,SUM(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,SUM(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,SUM(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,SUM(CASE WHEN Beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
 	,SUM(CASE WHEN Visits < 21 THEN 1 ELSE 0 END) AS Visits_20
 	,SUM(CASE WHEN Visits > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Visits_100
 	,SUM(CASE WHEN Visits >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Visits_500
 	,SUM(CASE WHEN Visits > 501 THEN 1 ELSE 0 END) AS Visits_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,(CASE WHEN Average_Daily_Census > 501 THEN 1 ELSE 0 END) AS Census_GT_500
 	,(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,(CASE WHEN Beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
 	,(CASE WHEN Visits < 21 THEN 1 ELSE 0 END) AS Visits_20
 	,(CASE WHEN Visits > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Visits_100
 	,(CASE WHEN Visits >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Visits_500
 	,(CASE WHEN Visits > 501 THEN 1 ELSE 0 END) AS Visits_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
select sum(Beds_20), sum(Beds_100), sum(Beds_500), sum(Beds_GT_500) from Main_Sites_Collapse;
select sum(Census_20), sum(Census_100), sum(Census_500), sum(Census_GT_500) from Main_Sites_Collapse;
select count(Census_20), count(Census_100), count(Census_500), count(Census_GT_500) from Main_Sites_Collapse;
CREATE TABLE Main_Sites_Collapse
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,(CASE WHEN Average_Daily_Census > 501 THEN 1 ELSE 0 END) AS Census_GT_500
 	,(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,(CASE WHEN Beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,(CASE WHEN Average_Daily_Census > 501 THEN 1 ELSE 0 END) AS Census_GT_500
 	,(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,(CASE WHEN Beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,(CASE WHEN Beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
 	,(CASE WHEN Average_Daily_Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,(CASE WHEN Average_Daily_Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,(CASE WHEN Average_Daily_Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,(CASE WHEN Average_Daily_Census > 501 THEN 1 ELSE 0 END) AS Census_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN Beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,(CASE WHEN Beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,(CASE WHEN Beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,(CASE WHEN Beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
 	,(CASE WHEN Census < 21 THEN 1 ELSE 0 END) AS Census_20
 	,(CASE WHEN Census > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Census_100
 	,(CASE WHEN Census >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Census_500
 	,(CASE WHEN Census > 501 THEN 1 ELSE 0 END) AS Census_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	#,Average_Daily_Census
	#,Visits
	#,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,(CASE WHEN beds > 20 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,(CASE WHEN beds >= 101 AND beds <= 500 THEN 1 ELSE 0 END) AS Beds_500
 	,(CASE WHEN beds > 501 THEN 1 ELSE 0 END) AS Beds_GT_500
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	#,Average_Daily_Census
	#,Visits
	#,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN beds < 21 THEN 1 ELSE 0 END) AS Beds_20
 	,(CASE WHEN beds > 20 AND beds <= 50 THEN 1 ELSE 0 END) AS Beds_50
 	,(CASE WHEN beds >= 51 AND beds <= 100 THEN 1 ELSE 0 END) AS Beds_100
 	,(CASE WHEN beds > 101 THEN 1 ELSE 0 END) AS Beds_GT_100
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	#,Average_Daily_Census
	#,Visits
	#,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN beds < 21 THEN 1 ELSE 0 END) AS Beds_20
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	#,Average_Daily_Census
	#,Visits
	#,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
 	,(CASE WHEN beds < 21 THEN 1 ELSE 0 END) AS Beds_20
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites, Visits;
select avg(beds), avg(Average_Daily_Census), avg(Visits) from Main_Sites;
select * from Main_Sites where Main_Site_ID = 215079;
select * from Main_Sites where Visits = 7416712;
select max(beds), max(Average_Daily_Census), max(Visits) from Main_Sites;
select max(beds) from Main_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,Average_Daily_Census
	,Visits
	,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites, Visits;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,Average_Daily_Census
	,Visits
	,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp,
	,Average_Daily_Census
	,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites, Beds;
SELECT
	Main_Site_ID
	,Hospital_Type
	,Number_of_Program_Sites
	,Number_of_DSC_Certifications
	,Number_of_NonDSC_Certifications
	,Volume_Year
	,Opdate_In_eapp
	,Beds
	,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
	,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 	,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 	,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
	,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
	,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 	,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 	,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 	,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 	,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 	,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 	,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 	,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 	,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
FROM Main_Sites
GROUP BY Main_Site_ID, Number_of_Program_Sites;
#select distinct Volume_Name, Setting from Main_Sites order by 1

#select Main_Site_ID, count(Site_ID), avg(Miles_from_Main_Site) from Secondary_Sites group by Main_Site_ID

#select count(distinct(Main_Site_ID)) from Main_Sites
/*
select * from Main_Sites where Hospital_Type = 'None'

select * from Main_Sites where Main_Site_ID = 584428

select distinct(Hospital_Type) from Main_Sites

select distinct Standard_Chapter_Name, Standard_Chapter_Code, Standard_ID from Survey_Findings

CREATE TABLE survey_findings_clean AS
select distinct * from survey where SAFER_Score = -1

select Survey_Event_ID, count(Survey_Event_ID) from Survey_Event group by Survey_Event_ID

select * from Survey_Event where Survey_Event_ID in 
(41426262
,39832452	
,40540587	
,39486131	
,40932517	
,39417908	
,40226001	
,41245744	
,40301983	
,41285093	
,39808437	
,41608133	
,39535479	
,40602742)	

Select distinct Survey_Event_Program_ID from survey_findings_clean

select * from information_schema.columns where table_schema = 'health_care'


SELECT 
	Program
	,Hospital_Type
	,Survey_Event_Type
	,Survey_Decision
	,System_Affiliation
	,Count_NonCompliant_Standards
	,Count_NonCompliant_EPs
	,Total_Surveyor_Days
	,Number_of_Surveyors 
	,Number_of_Surveyor_Class_Types
FROM Survey_Event
126729
115115
69238


select * from survey where Hospital_Type != Hosp_Type


select * from Main_Sites where Hospital_Type = "None"

select * from Main_Sites 
*/

CREATE TABLE survey AS
Select findings.Survey_Event_ID
	,findings.Survey_Event_Program_ID
	,event.Survey_Event_Type
	,event.Survey_Decision
	,findings.Survey_Begin_Date
	,findings.Survey_End_Date
	,findings.Survey_Year
	,findings.Main_Site_ID
	,event.Program
	,findings.Program_Code
	,findings.Program_Type
	,findings.Standard_Chapter_Code
	,findings.Standard_Chapter_Name
	,findings.Standard_ID
	,findings.Standard_Label
	,findings.EP_ID
	,findings.EP_Label
	,findings.Standard_and_EP_Label
	,findings.SAFER_Score
	,findings.SAFER_Scope
	,findings.SAFER_Likelihood
	,event.Hospital_Type
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_Program_Sites
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,findings.Site_ID
	,mile_info.Miles_from_Main_Site 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
CREATE TABLE survey AS
Select findings.*
	,event.Program
	,event.Hospital_Type
	,event.Survey_Event_Type
	,event.Survey_Decision
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Number_of_Program_Sites
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,mile_info.Miles_from_Main_Site 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
select * from survey where Hospital_Type != Hosp_Type;
CREATE TABLE survey AS
Select findings.*
	,event.Program
	,event.Hospital_Type
	,event.Survey_Event_Type
	,event.Survey_Decision
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Hospital_Type AS 'Hosp_Type'
	,main.Number_of_Program_Sites
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,mile_info.Miles_from_Main_Site 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
Select findings.*
	,event.Program
	,event.Hospital_Type
	,event.Survey_Event_Type
	,event.Survey_Decision
	,event.System_Affiliation
	,event.Count_NonCompliant_Standards
	,event.Count_NonCompliant_EPs
	,event.Total_Surveyor_Days
	,event.Number_of_Surveyors 
	,event.Number_of_Surveyor_Class_Types
	,main.Hospital_Type AS 'Hosp_Type'
	,main.Number_of_Program_Sites
	,main.Number_of_DSC_Certifications
	,main.Number_of_NonDSC_Certifications
	,main.Volume_Year
	,main.Opdate_In_eapp
	,mile_info.Miles_from_Main_Site 
FROM survey_findings_clean findings
LEFT JOIN (SELECT Site_ID, Miles_from_Main_Site FROM Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
LEFT JOIN (SELECT
		Main_Site_ID
		,Hospital_Type
		,Number_of_Program_Sites
		,Number_of_DSC_Certifications
		,Number_of_NonDSC_Certifications
		,Volume_Year
		,Opdate_In_eapp
		,COUNT(CASE WHEN Volume_Name = 'Academic' AND Setting = 'Academic' then 1 ELSE NULL END) as Academic
		,COUNT(CASE WHEN Volume_Name = 'Acute Care Only' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Addiction, Opioid Treatment/Methadone' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addiction_Opiod
 		,COUNT(CASE WHEN Volume_Name = 'Addictions, General' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Addictions
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Hospital w/ Hospital - Specialty Cardiac' then 1 ELSE NULL END) as Hosp_Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Cardiac' AND Setting = 'Specialty Cardiac Hospital' then 1 ELSE NULL END) as Spec_Cardiac
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Hospital w/ Hospital - Childrens' THEN 1 ELSE NULL END) as Hosp_Children
 		,COUNT(CASE WHEN Volume_Name = 'Children\'s' AND Setting = 'Pediatric Specialty Hospital' THEN 1 ELSE NULL END) as Spec_Children
		,COUNT(CASE WHEN Volume_Name = 'Eating Disorders' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Eating
		,COUNT(CASE WHEN Volume_Name = 'General' AND Setting = 'General Medical/Surgical Hospital' then 1 ELSE NULL END) as General
		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Hospital w/ Hospital - LTAC' then 1 ELSE NULL END) as Hosp_LT_Acute_Care
 		,COUNT(CASE WHEN Volume_Name = 'Long Term Acute Care' AND Setting = 'Long Term Acute Care Hospital' then 1 ELSE NULL END) as LT_Acute_Care_Hosp
 		,COUNT(CASE WHEN Volume_Name = 'Mental Health' AND Setting = 'Inpatient' then 1 ELSE NULL END) as Mental_Health
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Hospital w/ Hospital - Oncology' then 1 ELSE NULL END) as Hosp_Oncology
 		,COUNT(CASE WHEN Volume_Name = 'Oncology' AND Setting = 'Oncology Specialty Hospital' then 1 ELSE NULL END) as Oncology_Spec
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Hospital w/Hospital-Specialty Orthopedic' then 1 ELSE NULL END) as Hosp_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Orthopedic' AND Setting = 'Specialty Orthopedic Hospital' then 1 ELSE NULL END) as Spec_Orthopedic
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, Emergency Room' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Emer
 		,COUNT(CASE WHEN Volume_Name = 'Outpatient, Hospital, General' AND Setting = 'Outpatient' then 1 ELSE NULL END) as Out_Hosp_Gen
 		,COUNT(CASE WHEN Volume_Name = 'Psychiatric' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Psychiatric
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Hospital w/ Hospital - Rehabilitation' then 1 ELSE NULL END) as Hosp_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation' AND Setting = 'Physical Rehabilitation Hospital' then 1 ELSE NULL END) as Physical_Rehabilitation
 		,COUNT(CASE WHEN Volume_Name = 'Rehabilitation and Physical Medicine' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Rehabilitation_Med
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Hospital w/ Hospital - Specialty Surgery' then 1 ELSE NULL END) as Hosp_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Surgical' AND Setting = 'Specialty Surgery Hospital' then 1 ELSE NULL END) as Spec_Surgical
 		,COUNT(CASE WHEN Volume_Name = 'Swing' AND Setting = 'Critical Access Hospital' then 1 ELSE NULL END) as Swing
 		,COUNT(CASE WHEN Volume_Name = 'Teaching' And Setting = 'Teaching' then 1 ELSE NULL END) as Teaching
	FROM Main_Sites
	GROUP BY Main_Site_ID, Number_of_Program_Sites) main ON findings.Main_Site_ID = main.Main_Site_ID
LEFT JOIN (SELECT * FROM Survey_Event) event ON findings.Survey_Event_Program_ID = event.Survey_Event_Program_ID 
AND main.Hospital_Type = event.Hospital_Type;
select * from Main_Sites;
select * from Main_Sites where Main_Site_ID = 584428;
select * from Main_Sites where Hospital_Type = "None";
select * from survey Hospital_Type != Hosp_Type;
select * from survey Hospital_Type <> Hosp_Type;
select * from survey Hospital_Type <>Hosp_Type;
select Hospital_Type, Hosp_Type from survey