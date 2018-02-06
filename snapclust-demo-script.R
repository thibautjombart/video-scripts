## links to other resources
paper_url <- "http://onlinelibrary.wiley.com/doi/10.1111/2041-210X.12968/full"
browseURL("paper_url")


## install current version of adegenet
install.packages("adegenet")


## load adegenet
library("adegenet")


## check documentation of snapclust
apropos("snapclust")
?snapclust


## run basic microbov example
data(microbov)
res <- snapclust(microbov, 15)
compoplot(res)



## make zebu-salers F1 hybrids
zebu <- microbov[pop="Zebu"]
salers <- microbov[pop="Salers"]
hyb <- hybridize(zebu, salers, n=30)
x <- repool(zebu, salers, hyb)

## snapclust without hybrids
res.no.hyb <- snapclust(x, k=2, hybrids=FALSE)
compoplot(res.no.hyb, col.pal=spectral, n.col=2)

## snapclust with hybrids
res.hyb <- snapclust(x, k=2, hybrids=TRUE)
compoplot(res.hyb, col.pal =
            hybridpal(col.pal = spectral), n.col = 2)



## choose optimal 'k'
?snapclust.choose.k

data(dapcIllus)
a <- dapcIllus$a
a

## try and choose 'k' using AIC (real value = 6)
a.aic <- snapclust.choose.k(max = 10, a)
plot(1:10, a.aic, xlab = "Number of clusters (k)",
     ylab = "AIC", type = "b", pch = 20, cex = 3)

## try and choose 'k' using AIC (real value = 6)
a.kic <- snapclust.choose.k(max = 10, a, IC = KIC)
plot(1:10, a.kic, xlab = "Number of clusters (k)",
     ylab = "KIC", type = "b", pch = 20, cex = 3)



## open snapclust tutorial
adegenetTutorial("snapclust")

