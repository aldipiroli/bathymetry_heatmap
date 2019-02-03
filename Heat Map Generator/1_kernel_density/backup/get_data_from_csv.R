library('ggmap')
library('maptools')
MyData <- read.csv(file="/home/aldi/R-Dev/project/data/data.csv", header=TRUE, sep=",",quote = "",row.names = NULL, stringsAsFactors = FALSE)
lat <- MyData$X.lat.
lon <- MyData$X.lon.
h_geoid <- MyData$X.H_Geoid.

dataH <- data.frame(h_geoid)
h_geoid
dataH
xy <- cbind(lon,lat)
sp_xy <- SpatialPoints(xy)
bbox_xy <- bbox(sp_xy)
map_raw <- get_map(location = bbox_map, maptype = "terrain", source = "google", zoom = 10)
map <- ggmap(map_raw)