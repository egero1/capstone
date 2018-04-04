# https://www.r-bloggers.com/clustering-mixed-data-types-in-r/
library(cluster) # for gower similarity and pam
library(Rtsne) # for t-SNE plot
library(ggplot2) # for visualization
library(dplyr)
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

query = "SELECT Main_Site_ID ,GROUP_CONCAT(DISTINCT trim(Standard_Label) SEPARATOR ' - ') AS standards, Survey_Year, max_safer_score, Hospital_Type, Number_of_Program_Sites, Number_of_DSC_Certifications, Count_NonCompliant_Standards, Count_NonCompliant_EPs, Total_Surveyor_Days, Number_of_Surveyors, Number_of_Surveyor_Class_Types FROM tmp_survey_standard GROUP BY Main_Site_ID"

mydata <- dbGetQuery(conn = con, query)
lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
#mydata <- read.csv('/Users/ericgero/Desktop/query_result.csv')
mydata_use <- mydata
rownames(mydata_use) <- make.names(trimws(mydata_use$Main_Site_ID), unique = TRUE)

mydata_use <- mydata_use %>%
        mutate(name = row.names(.)) %>%
        mutate(standards = factor(standards)) %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        select(name, standards, Survey_Year, max_safer_score, Hospital_Type, Number_of_Program_Sites,
               Number_of_DSC_Certifications, Count_NonCompliant_Standards, Count_NonCompliant_EPs)

glimpse(mydata_use)
mydata_use <- mydata_use[mydata_use$max_safer_score > 1,]
gower_dist <- daisy(mydata_use[, -1],
                    metric = "gower",
                    type = list(logratio = 3))

summary(gower_dist)

gower_mat <- as.matrix(gower_dist)

# Output most similar pair
mydata_use[which(gower_mat == min(gower_mat[gower_mat != min(gower_mat)]), arr.ind = TRUE)[1, ], ]

# Output most dissimilar pair
mydata_use[which(gower_mat == max(gower_mat[gower_mat != max(gower_mat)]), arr.ind = TRUE)[1, ], ]

sil_width <- c(NA)

for(i in 2:10){
        pam_fit <- pam(gower_dist,
                       diss = TRUE,
                       k = i)
        
        sil_width[i] <- pam_fit$silinfo$avg.width
}

# Plot sihouette width (higher is better)

plot(1:10, sil_width,
     xlab = "Number of clusters",
     ylab = "Silhouette Width")
lines(1:10, sil_width)

pam_fit2 <- pam(gower_dist, diss = TRUE, k = 2)
pam_fit3 <- pam(gower_dist, diss = TRUE, k = 3)
pam_fit4 <- pam(gower_dist, diss = TRUE, k = 4)
pam_fit5 <- pam(gower_dist, diss = TRUE, k = 5)
pam_fit6 <- pam(gower_dist, diss = TRUE, k = 6)
pam_fit7 <- pam(gower_dist, diss = TRUE, k = 7)
pam_fit8 <- pam(gower_dist, diss = TRUE, k = 8)
pam_fit10 <- pam(gower_dist, diss = TRUE, k = 10)

pam_results2 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit2$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results3 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit3$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results4 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit4$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results5 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit5$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results6 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit6$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results7 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit7$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results8 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit8$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results10 <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit10$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

#pam_results$the_summary

mydata_use[pam_fit$medoids, ]

tsne_obj <- Rtsne(gower_dist, is_distance = TRUE)

tsne_data2 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit2$clustering),
               name = mydata_use$name)

tsne_data3 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit3$clustering),
               name = mydata_use$name)

tsne_data4 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit4$clustering),
               name = mydata_use$name)

tsne_data5 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit5$clustering),
               name = mydata_use$name)

tsne_data6 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit6$clustering),
               name = mydata_use$name)

tsne_data7 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit7$clustering),
               name = mydata_use$name)

tsne_data8 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit8$clustering),
               name = mydata_use$name)

tsne_data10 <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit10$clustering),
               name = mydata_use$name)

ggplot(aes(x = X, y = Y), data = tsne_data2) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 2 Clusters")

ggplot(aes(x = X, y = Y), data = tsne_data3) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 3 Clusters")

ggplot(aes(x = X, y = Y), data = tsne_data4) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 4 Clusters")

ggplot(aes(x = X, y = Y), data = tsne_data5) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 5 Clusters")

ggplot(aes(x = X, y = Y), data = tsne_data6) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 6 Clusters")

ggplot(aes(x = X, y = Y), data = tsne_data7) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 7 Clusters")

ggplot(aes(x = X, y = Y), data = tsne_data8) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 8 Clusters")

ggplot(aes(x = X, y = Y), data = tsne_data10) +
        geom_point(aes(color = cluster)) +
        ggtitle("Standards - 10 Clusters")

# Look at specific groups on the plot
tsne_data3 %>%
        filter(X > -40 & X < -20,
               Y > -20 & Y < 0) %>%
        left_join(mydata_use, by = "name") %>%
        collect %>%
        .[["name"]]
