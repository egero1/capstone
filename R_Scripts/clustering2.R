
# https://www.r-bloggers.com/clustering-mixed-data-types-in-r/
library(cluster) # for gower similarity and pam
library(Rtsne) # for t-SNE plot
library(ggplot2) # for visualization
library(dplyr)

mydata <- read.csv('/Users/ericgero/Desktop/tmp_survey_standard.csv')
mydata_use <- mydata[c(1,2,5,9,10,20,21,22,23,24)]
rownames(mydata_use) <- make.names(trimws(mydata_use$Main_Site_ID), unique = TRUE)
mydata_use <- mydata_use[mydata_use$max_safer_score > 0,]
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

pam_fit <- pam(gower_dist, diss = TRUE, k = 2)

pam_results <- mydata_use %>%
        dplyr::select(-Main_Site_ID) %>%
        mutate(cluster = pam_fit$clustering) %>%
        group_by(cluster) %>%
        do(the_summary = summary(.))

pam_results$the_summary

mydata_use[pam_fit$medoids, ]

tsne_obj <- Rtsne(gower_dist, is_distance = TRUE)

tsne_data <- tsne_obj$Y %>%
        data.frame() %>%
        setNames(c("X", "Y")) %>%
        mutate(cluster = factor(pam_fit$clustering),
               name = mydata_use$Main_Site_ID)

ggplot(aes(x = X, y = Y), data = tsne_data) +
        geom_point(aes(color = cluster))

tsne_data %>%
        filter(X > 15 & X < 25,
               Y > -15 & Y < -10) %>%
        left_join(college_clean, by = "name") %>%
        collect %>%
        .[["name"]]
