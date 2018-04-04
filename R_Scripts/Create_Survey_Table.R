
# This code creates the Survey table

library(RMySQL)
pw <- {
        'northwestern'
}

con <- dbConnect(MySQL(),
                 user = 'teamfour',
                 password = pw,
                 host = 'nu-predict-498-team-4.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                 dbname='health_care')


query <- "DROP TABLE IF EXISTS Survey"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE Survey AS
Select findings.Survey_Event_ID
,findings.Survey_Event_Program_ID
,evnt.Survey_Event_Type
,evnt.Survey_Decision
,findings.Survey_Begin_Date
,findings.Survey_End_Date
,findings.Survey_Year
,findings.Main_Site_ID
,evnt.Program
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
,evnt.Hospital_Type
,evnt.System_Affiliation
,evnt.Count_NonCompliant_Standards
,evnt.Count_NonCompliant_EPs
,evnt.Total_Surveyor_Days
,evnt.Number_of_Surveyors 
,evnt.Number_of_Surveyor_Class_Types
,main.Number_of_DSC_Certifications
,main.Number_of_NonDSC_Certifications
,main.Volume_Year
,main.Opdate_In_eapp
,findings.Site_ID
,mile_info.Miles_from_Main_Site
,main.Number_of_Program_Sites
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
FROM src_Survey_Findings findings
LEFT JOIN (SELECT DISTINCT Site_ID, Miles_from_Main_Site FROM src_Secondary_Sites) mile_info ON findings.Site_ID = mile_info.Site_ID
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
           FROM src_Main_Sites
           GROUP BY Main_Site_ID) main ON findings.Main_Site_ID = main.Main_Site_ID
RIGHT JOIN (SELECT distinct * FROM src_Survey_Event) evnt ON findings.Survey_Event_Program_ID = evnt.Survey_Event_Program_ID" 
dbSendQuery(conn = con, query)

lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)