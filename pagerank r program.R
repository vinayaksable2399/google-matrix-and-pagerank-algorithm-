#import dependency packages for "ggplot2" 
install.packages("miniCRAN")

library(miniCRAN)
library(igraph)
library(magrittr)
library(miniCRAN)
pkgs <- "ggplot2"
pkgDep(pkgs, suggests=FALSE, enhances=FALSE, includeBasePkgs = TRUE)

#suggest packages for "ggplot"
pkgDep(pkgs, suggests=TRUE, enhances=FALSE, includeBasePkgs = TRUE)

#dependency structure of "ggplot2"
plot(makeDepGraph(pkgs, includeBasePkgs=FALSE, suggests=FALSE, enhances=TRUE), 
 legendPosEdge = c(-1, 1), legendPosVertex = c(1, 1), vertex.size=20)
####################################################################################################################
m=matrix(c(0,1,0,0,0,0,1,0,1/2,0,0,1/2,0,0,0,0),byrow=T,nrow=4);m
p=matrix(rep(1/6,6),byrow=T,nrow=1);p
gr=graph.adjacency(m, weighted = TRUE, mode = "directed")
plot(gr)

n=nrow(h);n
p=matrix(rep(1/n,n),byrow=T,nrow=1)
z=which(rowSums(h)==0)
a=matrix(rep(0, n), nrow=n);a[z, ]=1
e=matrix(rep(1,n),nrow=n)
d=0.85
G=d*h+d*a%*%t(e)/(n)+(1-d)*(e%*%t(e))/(n)
G

for(j in 1:142)
{

p=p%*%G

}
p






#############################################################################################################
#How many package were added in the window 1/7/2017 to 18/9/2017
MRAN <- "http://mran.revolutionanalytics.com/snapshot/2017-09-18/"
pdb <- MRAN %>%
 contrib.url(type = "source") %>%
 available.packages(type="source", filters = NULL)
g <- pdb[, "Package"] %>%
 makeDepGraph(availPkgs = pdb, suggests=FALSE, enhances=TRUE, includeBasePkgs = FALSE)



pr <- g %>%
 page.rank(directed = FALSE) %>%
 use_series("vector") %>%
 sort(decreasing = TRUE) %>%
 as.matrix %>%
 set_colnames("page.rank")

nrow(pr)

head(pr,10)

############################################################################################################


MRAN <- "http://mran.revolutionanalytics.com/snapshot/2017-07-01"

pdb1 <- MRAN %>%
 contrib.url(type = "source") %>%
 available.packages(type="source", filters = NULL)
g1 <- pdb1[, "Package"] %>%
makeDepGraph(availPkgs = pdb, suggests=FALSE, enhances=TRUE, includeBasePkgs = FALSE)

pr1 <- g1 %>%
 page.rank(directed = FALSE) %>%
 use_series("vector") %>%
 sort(decreasing = TRUE) %>%
 as.matrix %>%
 set_colnames("page.rank")

nrow(pr1)


nrow(pr) - nrow(pr1)

head(pr1,10)
###################################################################################################################
