ls()
rm(list=ls())
gc()

set.seed(1020)
x=rt(1000,df=10)

f=function(v2, v1, y)
{
  r=1
  for ( i in 1:length(y))
  {
    r=r * gamma((v2+1)/2)/gamma(v2/2)/sqrt(v2)*(1+y[i]^2/v2)^(-(v2+1)/2)  
    
    r=r/( gamma((v1+1)/2)/gamma(v1/2)/sqrt(v1)*(1+y[i]^2/v1)^(-(v1+1)/2) )
  }
  r
}

#f(10, 11, x)

v_current=15
N=10000
a <- numeric(N)
a[1]=v_current
for (n in 1:N)
{
  v2=v_current+rnorm(1, 0, 1.5)
  
  while (v2 <= 3 || v2 >= 20)
  {
    v2 = v_current + rnorm(1, 0, 1.5)
  }
  u=runif(1, min=0, max=1)
  if (u <= min(1, f(v2, v_current, x))  ){
    a[n]=v2
    v_current=v2
  }
  else{
    a[n]=v_current
  }
  # print(c(n, a[n]))
}

print(c(mean(a), sd(a)))

dev.off()
graphics.off()
par(mar=c(4,4,4,4))
n=1:5000

plot(n,a[5001:10000],type = "l",col = "blue",xlab="",ylab="", cex.lab=1.25,cex.axis=2,main = TeX('Time series of $v$'),cex.main=2)

  
