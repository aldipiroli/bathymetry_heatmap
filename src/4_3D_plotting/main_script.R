rm(list=ls()) #clear envirment var
cat("\014") #console clear
setwd(path.expand("/home/aldi/R-Dev/HeatMapper_v0.1/4_3D_plotting/")) #set dir path

#---------------------------------------------------------------------------------------#

MyData <- read.csv(file="/home/aldi/R-Dev/HeatMapper_v0.1/4_3D_plotting/data/data.csv", header=TRUE, sep=",",quote = "",row.names = NULL, stringsAsFactors = FALSE)

z <- MyData$data_1
x <- MyData$lat
y <- MyData$lon
id <- MyData$ID_1

mydata <- data.frame(x,y,z,id)
mydata <- mydata[order(mydata$x),]

z_sorted <- mydata$z
z = matrix(z_sorted,nrow=5, ncol=5)
