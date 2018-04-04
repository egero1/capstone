library(RMySQL)

connect <- function() {
        connection <- dbConnect(MySQL(),
                user = 'teamfour',
                password = 'northwestern',
                host = 'nu-predict-498-team-4.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                dbname='health_care')
        return(connection)
}

get_hospital_types <- function() {
        query <- "SELECT DISTINCT Hospital_Type FROM app_Hospital_Types ORDER BY 1"
        conn <- connect()
        data <- dbGetQuery(conn = conn, query)
        lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
        return(data)
}

get_chapter_names <- function(hospital_type) {
        query <- sprintf("SELECT Standard_Chapter_Name, Standard_Label, occurrences FROM app_Standards std WHERE Hospital_Type = '%s' GROUP BY 1, 2 ORDER BY occurrences DESC, std.Standard_Chapter_Name", hospital_type)
        conn <- connect()
        data <- dbGetQuery(conn = conn, query)
        data <- paste(data$Standard_Chapter_Name, data$Standard_Label, sep = " - ")
        lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
        return(data)
}

get_chapter_names_only <- function() {
        query <- sprintf("SELECT Standard_Chapter_Name, Standard_Label, occurrences FROM app_Standards std ORDER BY occurrences DESC")
        conn <- connect()
        data <- dbGetQuery(conn = conn, query)
        data <- paste(data$Standard_Chapter_Name, data$Standard_Label, sep = " - ")
        #    lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
        return(data)
}

get_standards <- function(hospital_type, standard) {
        hospital_type <- gsub("'", "", hospital_type)
        query <- sprintf("SELECT standard_label2, survey_event_prob AS probabilities FROM fnl_standards_pairs WHERE standard_label1 = '%s' and REPLACE(hospital_type, \"'\", \"\") = '%s' ORDER BY 2 DESC LIMIT 5;", standard, hospital_type)
        #   output$query <- renderText({query})
        conn <- connect()
        data <- dbGetQuery(conn = conn, query)
        #lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
        return(data)
}

get_safer_risk <- function(hospital_type, standard) {
        hospital_type <- gsub("'", "", hospital_type)
        query <- sprintf("SELECT COALESCE(ROUND(MIN(Predicted), 2), ROUND(avg_predicted), 2) AS min_safer_risk, COALESCE(ROUND(AVG(Predicted), 2), ROUND(avg_predicted), 2) AS avg_safer_risk, COALESCE(ROUND(MAX(Predicted), 2), ROUND(avg_predicted), 2) AS max_safer_risk from app_Predicted_SAFER WHERE REPLACE(Hospital_Type, \"'\", \"\") = '%s' AND Standard_Label = '%s' ", hospital_type, standard)
        conn <- connect()
        data <- dbGetQuery(conn = conn, query)
        lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
        return(data)
}

get_hospital_by_standard <- function(standard) {
        query <- sprintf("SELECT TRIM(Standard_Label) AS Standard_Label, TRIM(Hospital_Type) AS Hospital_Type, AVG(program_sites) AS Program_Sites, ROUND(MAX(Predicted), 2) AS Predicted_SAFER FROM app_Predicted_SAFER WHERE Standard_Label = '%s' GROUP BY 1, 2 ORDER BY 4 DESC, 1, 2", standard)
        conn <- connect()
        data <- dbGetQuery(conn = conn, query)
        colnames(data) <- c("Standard Label", "Hospital Type", "Program Sites", "Predicted SAFER Score")
        lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
        return(data)
}
