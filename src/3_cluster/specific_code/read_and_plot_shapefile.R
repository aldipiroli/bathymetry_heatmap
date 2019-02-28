rm(list=ls()) #clear envirment var
cat("\014") #console clear
setwd(path.expand("/home/aldi/R-Dev/HeatMapper_v0.1/3_cluster/")) #set dir path

#---------------------------------------------------------------------------------------#
library(rgdal)
library(ggplot2)
library(plyr)
library(ggmap)
lnd <- readOGR("data/polygon_divided", "polygon_divided")
lnd <- (SpatialPolygonsDataFrame(Sr = spTransform(lnd, CRSobj = CRS("+init=epsg:4326")), 
                                 data = lnd@data))
lnd.f <- fortify(lnd)
head(lnd@data)
head(lnd.f)
lnd$id <- row.names(lnd)  # provide same column names for join

lnd.f <- join(lnd.f, lnd@data)
head(lnd.f)

b <- bbox(lnd)
lnd.b1 <- ggmap(get_map(location = b,zoom=8))  # download map data for the lnd data and plot
lnd.b1 + geom_polygon(data = lnd.f, aes(x = long, y = lat, group = group, fill = lat), 
                      alpha = 0.5) + scale_fill_continuous(low = "green", high = "red")  # add interesting scale
