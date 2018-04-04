library(RMySQL)
pw <- {
        'northwestern'
}

con <- dbConnect(MySQL(),
                 user = 'teamfour',
                 password = pw,
                 host = 'nu-predict-498-team-4.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                 dbname='health_care')


query <- "UPDATE app_Predicted_SAFER a
LEFT JOIN (SELECT Standard_Label, AVG(Predicted) AS avg_predicted from app_Predicted_SAFER GROUP BY 1) b ON
a.Standard_Label = b.Standard_Label
SET
a.avg_predicted = b.avg_predicted"
dbSendQuery(conn = con, query)

query <- "UPDATE app_Predicted_SAFER a
LEFT JOIN app_Predicted_Hospital b ON
a.Standard_Label = b.Standard_Label
and a.Hospital_Type = b.Hospital_Type
SET
a.program_sites = b.Number_of_Program_Sites"
dbSendQuery(conn = con, query)

lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)