library('ggmap')
library('maptools')
library('plyr')
# fake data
set.seed(1234)
n <- 500
gg <- data.frame(wf=rnorm(n,0.5),wb=rnorm(n,0.5),z=runif(n,0,10))
gg

# plot it
gg$`My Title` <- gg$z

ggplot(data=gg, aes(x=wf, y=wb, color=`My Title`)) + 
  geom_point(aes(colour=z),shape="") +
  stat_density2d(aes(fill = ..level..),n = 100,contour = TRUE,geom = "polygon") 
  #labs(x=expression(w[f]),y=expression(w[b])) +
  #guides(fill=F)