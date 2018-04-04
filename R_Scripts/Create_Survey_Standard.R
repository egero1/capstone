
# This code creates the fnl_standard_survey table

library(RMySQL)
pw <- {
        'northwestern'
}

con <- dbConnect(MySQL(),
                 user = 'teamfour',
                 password = pw,
                 host = 'nu-predict-498-team-4.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                 dbname='health_care')

query <- "DROP TABLE IF EXISTS fnl_survey_standard"
dbSendQuery(conn = con, query)

query = "CREATE TABLE fnl_survey_standard AS 
SELECT
fdg.Main_Site_ID
,fdg.Standard_Chapter_Name
,COUNT(fdg.Standard_Chapter_Name) AS cnt_std_chapter_name
,fdg.Survey_Year
,MAX(fdg.SAFER_Score) AS max_safer_score
,MIN(fdg.SAFER_SCORE) AS min_safer_score
,(CASE WHEN SAFER_Score < 0 THEN 'None' 
  WHEN SAFER_Score > 0 AND SAFER_Score <= 3 THEN 'Low'
  WHEN SAFER_Score >= 4 AND SAFER_Score <= 6 THEN 'Medium'
  WHEN SAFER_Score >= 7 AND SAFER_Score <= 9 THEN 'High'
  WHEN SAFER_Score = 10 THEN 'LT' END) AS SAFER
,mn.Hospital_Type
,mn.Number_of_Program_Sites
,mn.Number_of_DSC_Certifications
,mn.System_Affiliation
,mn.Opdate_In_eapp
,mn.Accreditation_Decision
,ev.Program
,ev.Program_Code
,ev.Survey_Event_Type
,ev.Survey_Begin_Date
,ev.Survey_End_Date
,ev.Survey_Decision
,ev.Count_NonCompliant_Standards
,ev.Count_NonCompliant_EPs
,ev.Total_Surveyor_Days
,ev.Number_of_Surveyors
,ev.Number_of_Surveyor_Class_Types
FROM src_Survey_Findings fdg
JOIN (SELECT DISTINCT Main_Site_ID
      ,Hospital_Type
      ,Number_of_Program_Sites 
      ,Number_of_DSC_Certifications 
      ,System_Affiliation
      ,Opdate_In_eapp
      ,Accreditation_Decision
      FROM src_Main_Sites) AS mn
ON mn.Main_Site_ID = fdg.Main_Site_ID
JOIN src_Survey_Event ev ON ev.Survey_Event_Program_ID = fdg.Survey_Event_Program_ID
GROUP BY fdg.Main_Site_ID
,fdg.Standard_Chapter_Name
,fdg.Survey_Year"
dbSendQuery(conn = con, query)

lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)