
library(cluster) ## for pam 
mydata <- read.csv('/Users/ericgero/Desktop/tmp_survey_standard.csv')
mydata_use <- mydata[c(1,2,5,9,10,20,21,22,23,24)]

# Set standard_label as row name
rownames(mydata_use) <- make.names(trimws(mydata_use$Main_Site_ID), unique = TRUE)
mydata_use <- mydata_use[mydata_use$max_safer_score > 0,]

# Scale the data
scaled.dat <- scale(mydata_use[-c(1,2)])
#data_use <- cbind(mydata_use$Main_Site_ID, mydata_use$Standard_Label, scaled.dat)
# Distances and clusters
mydata_use_dist <- dist(scaled.dat)
data_use <- cbind(mydata_use$Main_Site_ID, mydata_use$Standard_Label, scaled.dat)
mydata_use_clust <- hclust(mydata_use_dist)
plot(mydata_use_clust, labels = mydata$Main_Site_ID)

# View cluster counts
counts = sapply(2:10, function(ncl)table(cutree(mydata_use_clust, ncl)))
counts

clusters <- cutree(mydata_use_clust, 6)
table(clusters)
plot(clusters)

sapply(unique(clusters),function(g)mydata$Main_Site_ID[clusters == g])

