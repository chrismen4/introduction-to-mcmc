

# analyze MCMC fit for a logistic regression model
# clean everything first 

ls()
rm(list=ls())
gc()
library(latex2exp)
#library(matrixStats)
mydata = read.table("R-mcmc_logistic_version_1.txt",header=T)  # read text file 
est=data.matrix(mydata) 
aa=as.matrix(mydata)
a1=dim(aa)
sub_sample=a1[1]
bb=aa[5001:sub_sample,]
x1=bb[,2]
x2=bb[,3]
x3=bb[,4]
x4=bb[,5]
n=1:length(x1)

par(mar=c(3,3,3,3))

par(mfrow = c(2, 2))
plot(n,x1,type = "l",col = "blue",xlab="",ylab="", cex.lab=1.25,cex.axis=2,main = TeX('Time series of $\\beta_0$'),cex.main=2)
plot(n,x2,type = "l",col = "blue",xlab="",ylab="", cex.lab=1.25,cex.axis=2,main = TeX('Time series of $\\beta_1$'),cex.main=2)
plot(n,x3,type = "l",col = "blue",xlab="",ylab="", cex.lab=1.25,cex.axis=2,main = TeX('Time series of $\\beta_2$'),cex.main=2)
plot(n,x4,type = "l",col = "blue",xlab="",ylab="", cex.lab=1.25,cex.axis=2,main = TeX('Time series of $\\beta_3$'),cex.main=2)

print(colMeans(bb))
print(colSds(bb))

