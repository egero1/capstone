# This code collects the standards from the 
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


query <- "DROP TABLE IF EXISTS tmp_standards_counts"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE tmp_standards_counts AS
SELECT trim(foo.HOSPITAL_TYPE) AS Hospital_Type, COUNT(foo.Survey_Event_ID) AS divisor 
FROM
(SELECT ms.Main_Site_ID, ms.Hospital_Type, sf.Survey_Event_ID FROM src_Survey_Findings sf JOIN
(SELECT DISTINCT main_site_id, hospital_type FROM src_Main_Sites) ms ON ms.Main_Site_ID = sf.Main_Site_ID) AS foo
GROUP BY foo.Hospital_Type"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS tmp_standards_occ"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE tmp_standards_occ AS 
SELECT sf.Survey_Event_ID, trim(ms.Hospital_Type) AS Hospital_Type, GROUP_CONCAT(sf.Standard_ID ORDER BY sf.Standard_ID SEPARATOR ';' ) AS Standards 
FROM src_Survey_Findings sf
JOIN (SELECT DISTINCT Main_Site_ID, Hospital_Type FROM src_Main_Sites) AS ms ON ms.Main_Site_ID = sf.Main_Site_ID
GROUP BY 1"
dbSendQuery(conn = con, query)

standards <- dbGetQuery(conn = con, 'select CONCAT(Hospital_Type, ";", Standards) AS standards from tmp_standards_occ')

# split all rows
for (rows in standards) {
        splits <- strsplit(rows, ";")
}

#full_vector <- vector()
#for (row in 1:length(splits)) {
#        hosp_type <- trimws(splits[[row]][1])
#        standard1 <- trimws(splits[[row]][2:length(splits[[row]])])
#        standard2 <- standard1
#        pairs <- outer(standard1, standard2, paste, sep=";") 
#        vect <-as.vector(pairs)
#        cvect <- paste(hosp_type, vect, sep = ";")
#        full_vector <- c(full_vector, cvect)
#}

ht_vector <- c()
std1_vector <- c()
std2_vector <- c()
i <- 0
for (row in 1:length(splits)) {
        if (length(splits[[row]]) > 1) {
                hosp_type <- trimws(splits[[row]][1])
                for (index in 2:length(splits[[row]])) {
                        standard1 <- trimws(splits[[row]][index])
                        for (inner in index:length(splits[[row]])) {
                                if (index == inner) next
                                standard2 <- trimws(splits[[row]][inner])
                                cat("row: ", row, " index: ", index, " inner: ", inner, "\n")
                                
                                i <- i + 1
                                ht_vector[i] <- hosp_type
                                std1_vector[i] <- standard1
                                std2_vector[i] <- standard2
                        }
                }
        }
}

results <- data.frame("hospital_type" = ht_vector, "standard1" = std1_vector, "standard2" = std2_vector, "count" = 1)

query <- "DROP TABLE IF EXISTS tmp_standards_occ"
dbSendQuery(conn = con, query)

dbWriteTable(conn = con, name = 'tmp_standards_occ', value = results)

query <- "DROP TABLE IF EXISTS fnl_standards_pairs"
dbSendQuery(conn = con, query)

query <- "CREATE TABLE fnl_standards_pairs AS SELECT so.hospital_type, so.standard1, so.standard2, sc.divisor, (SUM(so.count)/36315) AS overall_percent, SUM(so.count) AS occurrences, (SUM(so.count)/sc.divisor) AS survey_event_prob
FROM tmp_standards_occ so 
JOIN tmp_standards_counts sc ON sc.Hospital_type = so.Hospital_Type
GROUP BY 1, 2, 3"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS tmp_standards_counts"
dbSendQuery(conn = con, query)

query <- "DROP TABLE IF EXISTS tmp_standards_occ"
dbSendQuery(conn = con, query)

# Populate the standard label columns
query <- "UPDATE fnl_standards_pairs a
LEFT JOIN app_Standards b ON
a.Standard1 = b.Standard_ID
SET
standard_label1 = b.Standard_Label"
dbSendQuery(conn = con, query)

query <- "UPDATE fnl_standards_pairs a
LEFT JOIN app_Standards b ON
a.Standard2 = b.Standard_ID
SET
standard_label2 = b.Standard_Label"
dbSendQuery(conn = con, query)
lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)


