# cor = TRUE indicates that PCA is performed on 
# standardized data (mean = 0, variance = 1)
pcaCars <- princomp(mtcars, cor = TRUE)

# view objects stored in pcaCars
names(pcaCars)

# proportion of variance explained
summary(pcaCars)

# scree plot
plot(pcaCars, type = "l")

# bar plot
plot(pcaCars)

# cluster cars
carsHC <- hclust(dist(pcaCars$scores), method = "ward.D2")

# dendrogram
plot(carsHC)

# cut the dendrogram into 3 clusters
carsClusters <- cutree(carsHC, k = 3)

# add cluster to data frame of scores
carsDf <- data.frame(pcaCars$scores, "cluster" = factor(carsClusters))
str(carsDf)

# plot the first 2 PCs with cluster membership
# need to install ggplot2 and ggrepel packages first
# using the following command in R:
# install.packages(c("ggplot2","ggrepel"))
install.packages("ggplot2")
library(ggplot2)
install.packages("ggrepel")
library(ggrepel)
ggplot(carsDf, aes(x=Comp.1, y=Comp.2))+
  geom_text_repel(aes(label = rownames(carsDf)))+
  theme_classic()+
  geom_hline(yintercept = 0, color = "gray70")+
  geom_vline(xintercept = 0, color = "gray70")+
  geom_point(aes(color = cluster), alpha = 0.55, size = 3)+
  xlab("PC1")+
  ylab("PC2")+
  xlim(-5, 6)+
  ggtitle("PCA plot of cars")

  

