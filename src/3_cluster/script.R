rm(list=ls()) #clear envirment var
cat("\014") #console clear
setwd(path.expand("/home/aldi/R-Dev/HeatMapper_v0.1/3_cluster/")) #set dir path

#---------------------------------------------------------------------------------------#
library(rgdal)
library(ggplot2)
library(plyr)
library(ggmap)
lnd <- readOGR("data/data_trasimeno", "data_trasimeno")
plot(lnd)
lnd <- (SpatialPolygonsDataFrame(Sr = spTransform(lnd, CRSobj = CRS("+init=epsg:4326")), data = lnd@data))
lnd.lenght<-length(lnd@data$ID_1)

mydata<-data.frame(id=lnd@data$ID_1, data_1=lnd@data$data_1,prevalence=rnorm(lnd.lenght, 55, 20))

#print(mydata$id)
#print(lnd$ID_1)
lnd.f <- fortify(lnd,region = "ID_1")

merge.shp.coef<-merge(lnd.f, mydata, by="id", all.x=TRUE)
final.plot<-merge.shp.coef[order(merge.shp.coef$order), ] 
final.plot

b <- bbox(lnd)

#example_1: ggmap
lnd.b1 <- ggmap(get_map(location = b,zoom = 12,scale="auto",maptype = "terrain"))  # download map data for the lnd data and plot

lnd.b1 + geom_polygon(data = final.plot, aes(x = long, y = lat, group = group, fill = data_1), 
                      alpha = 0.5) + 
  #scale_fill_continuous(low = "green", high = "red") +
  #stat_density2d(data = final.plot, aes(x = long, y = lat ,alpha = ..level..), geom = "polygon", position = "identity", contour = TRUE, n = 100,show.legend = FALSE) + 
  #geom_density2d(data = final.plot, aes(x = long, y = lat), size = 0.1, colour = "black", shape = 2,stat = "density2d")+
  #geom_point(data=final.plot, mapping=aes(long, lat),shape = 20,show.legend = FALSE, size = 0.1)+   #size = data1
  #scale_fill_gradient(low = "darkgreen", high = "darkred") +            
  scale_fill_gradientn(colours = terrain.colors(10))+
  scale_alpha(range = c(0, 1), guide = FALSE)


#---------------------------------------------------------------------------------------#
img_name <-paste("map_resoults/",Sys.time(),".png")
ggsave (img_name, dpi = 800) #this saves the output to a file
