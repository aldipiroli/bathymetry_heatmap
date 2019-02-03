library(ggmap)
library(plyr)


MyData <- read.csv(file="/home/aldi/R-Dev/project/data/data_prova3.csv", header=TRUE, sep=",",quote = "",row.names = NULL, stringsAsFactors = FALSE)

data_1 <- MyData$X.data_1.
lon <- MyData$X.lon.
lat <- MyData$X.lat.

bbox <- ggmap::make_bbox(lon, lat)
img_Mapa <- get_map(location = bbox, source = 'google', maptype = 'terrain', zoom = 10)

ds_DadosAcessos <- data.frame(lon, lat, data_1)
ds_DadosAcessos
temp <- apply(ds_DadosAcessos, 1, function(x) { data.frame(lon = as.numeric(rep(x[1], log(as.numeric(x[3])))), 
                                                           lat = as.numeric(rep(x[2], log(as.numeric(x[3])))))})
heatdata2 <- ldply(temp, rbind)


set.seed(1234)
n <- 500
gg <- data.frame(wf=rnorm(n,0.5),wb=rnorm(n,0.5),z=runif(n,0,10))

ggmap(img_Mapa, extent = "device",aes(x=lat, y=lon, color=data_1))