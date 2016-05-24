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
