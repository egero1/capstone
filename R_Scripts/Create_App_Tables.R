# This code collects the EPs from the 
# base table then counts the number of occurences as observed in surveys.

library(RMySQL)
pw <- {
        'northwestern'
}

con <- dbConnect(MySQL(),
                 user = 'teamfour',
                 password = pw,
                 #host = 'healthcare.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                 host = 'nu-predict-498-team-4.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                 dbname='health_care')


query <- "DROP TABLE IF EXISTS app_tmp_Standards"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE app_tmp_Standards AS
SELECT DISTINCT trim(Standard_Chapter_Name) AS Standard_Chapter_Name, trim(Standard_Label) AS Standard_Label, Standard_ID FROM src_Survey_Findings"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS app_Standards"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE app_Standards AS
SELECT distinct REPLACE(prs.Hospital_Type, \"'\", \"\") AS Hospital_Type, std.Standard_Chapter_Name, std.Standard_Label, std.Standard_ID, prs.occurrences 
FROM app_tmp_Standards std 
JOIN fnl_standards_pairs prs ON prs.standard1 = std.Standard_ID
GROUP BY 4, 1
ORDER BY prs.occurrences DESC, std.Standard_Chapter_Name"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS app_tmp_Standards"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS app_Hospital_Types "
dbSendQuery(conn = con, query)

query <- "CREATE TABLE app_Hospital_Types AS
SELECT DISTINCT trim(REPLACE(Hospital_Type, \"'\", \"\")) AS Hospital_Type FROM src_Main_Sites"
dbSendQuery(conn = con, query)

lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)