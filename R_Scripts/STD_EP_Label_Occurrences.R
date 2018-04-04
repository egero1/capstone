# This code collects the Standard and EP labels from the 
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


query <- "DROP TABLE IF EXISTS tmp_ep_counts"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE tmp_ep_counts AS
SELECT trim(foo.HOSPITAL_TYPE) AS Hospital_Type, COUNT(foo.Survey_Event_ID) AS divisor
FROM
(SELECT ms.Main_Site_ID, ms.Hospital_Type, sf.Survey_Event_ID FROM src_Survey_Findings sf JOIN
(SELECT DISTINCT main_site_id, hospital_type FROM src_Main_Sites) ms ON ms.Main_Site_ID = sf.Main_Site_ID) AS foo
GROUP BY foo.Hospital_Type"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS tmp_stdep_occ"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE tmp_stdep_occ AS 
SELECT sf.Survey_Event_ID, trim(ms.Hospital_Type) AS Hospital_Type, GROUP_CONCAT(sf.Standard_and_EP_Label ORDER BY sf.Standard_and_EP_Label SEPARATOR ';') AS std_ep_label
FROM src_Survey_Findings sf
JOIN (SELECT DISTINCT Main_Site_ID, Hospital_Type FROM src_Main_Sites) AS ms ON ms.Main_Site_ID = sf.Main_Site_ID
GROUP BY 1"
dbSendQuery(conn = con, query)

standards <- dbGetQuery(conn = con, 'select CONCAT(Hospital_Type, ";", std_ep_label) AS std_ep_label from tmp_stdep_occ')

# split all rows
for (rows in standards) {
        splits <- strsplit(rows, ";")
}

ht_vector <- c()
ep1_vector <- c()
ep2_vector <- c()
i <- 0
for (row in 1:length(splits)) {
        if (length(splits[[row]]) > 1) {
                hosp_type <- trimws(splits[[row]][1])
                for (index in 2:length(splits[[row]])) {
                        ep1 <- trimws(splits[[row]][index])
                        for (inner in index:length(splits[[row]])) {
                                if (index == inner) next
                                ep2 <- trimws(splits[[row]][inner])
                                cat("row: ", row, " index: ", index, " inner: ", inner, "\n")
                                
                                i <- i + 1
                                ht_vector[i] <- hosp_type
                                ep1_vector[i] <- ep1
                                ep2_vector[i] <- ep2
                        }
                }
        }
}

results <- data.frame("hospital_type" = ht_vector, "std_ep_label1" = ep1_vector, "std_ep_label2" = ep2_vector, "count" = 1)

query <- "DROP TABLE IF EXISTS tmp_stdep_occ"
dbSendQuery(conn = con, query)

dbWriteTable(conn = con, name = 'tmp_stdep_occ', value = results)

query <- "DROP TABLE IF EXISTS fnl_std_ep_pairs"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE fnl_std_ep_pairs AS SELECT so.hospital_type, so.std_ep_label1, so.std_ep_label2, sc.divisor, SUM(so.count) AS occurrences, (SUM(so.count)/1868689) AS overall_percent, (SUM(so.count)/sc.divisor) AS survey_event_prob
FROM tmp_stdep_occ so 
JOIN tmp_ep_counts sc ON sc.Hospital_type = so.Hospital_Type
GROUP BY 1, 2, 3"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS tmp_ep_counts"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS tmp_stdep_occ"
dbSendQuery(conn = con, query)

lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)