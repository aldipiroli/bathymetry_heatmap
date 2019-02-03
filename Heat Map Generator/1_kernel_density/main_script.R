rm(list=ls()) #clear envirment var
cat("\014") #console clear
setwd(path.expand("/home/aldi/R-Dev/HeatMapper_v0.1/1_kernel_density/")) #set dir path

#---------------------------------------------------------------------------------------#
library(ggmap)
library(plyr)


MyData <- read.csv(file="/home/aldi/R-Dev/HeatMapper_v0.1/1_kernel_density/data/data_trasimeno.csv", header=TRUE, sep=",",quote = "",row.names = NULL, stringsAsFactors = FALSE)

data_1 <- MyData$data_1
lon <- MyData$lon
lat <- MyData$lat

bbox <- ggmap::make_bbox(lon, lat)
bbox
img_Mapa <- get_map(location = bbox, source = 'google', maptype = 'terrain', zoom = 12)

ds_DadosAcessos <- data.frame(lon, lat, data_1)

temp <- apply(ds_DadosAcessos, 1, function(x) { data.frame(lon = as.numeric(rep(x[1])), 
                                                           lat = as.numeric(rep(x[2])))})
heatdata2 <- ldply(temp, rbind)

ggmap(img_Mapa, extent = "device") + 
  stat_density2d(data = heatdata2, 
                 aes(x = lon, y = lat, fill = ..level.. , alpha = ..level..), 
                 geom = "polygon", position = "identity", contour = TRUE, n = 100,show.legend = FALSE) + 
  geom_density2d(data = heatdata2, aes(x = lon, y = lat), size = 0.3, colour = "black", shape = 2)+
  geom_point(data=heatdata2, mapping=aes(lon, lat),shape = 20,show.legend = FALSE, size = 0.1)+   #size = data1
  scale_fill_gradient(low = "green", high = "red") +            
  scale_alpha(range = c(0, 1), guide = FALSE)