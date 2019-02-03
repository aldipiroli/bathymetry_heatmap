# Get this figure: fig <- get_figure("empet", 3754)
# Get this figure's data: data <- get_figure("empet", 3754)$data
# Add data to this figure: p <- add_trace(p, x=c(4, 5), y=c(4, 5), kwargs=list(filename="Mount-Bruno-dem6cs", fileopt="extend"))
# Get z data of first trace: z1 <- get_figure("empet", 3754)$data[[1]]$z

# Get figure documentation: https://plot.ly/r/get-requests/
# Add data documentation: https://plot.ly/r/file-options/

# You can reproduce this figure in R with the following code!

# Learn about API authentication here: https://plot.ly/r/getting-started
# Find your api_key here: https://plot.ly/settings/api

library(plotly)
#-----------------------------------------------------------------------#
#--- fetch data ---#
#-----------------------------------------------------------------------#
MyData <- read.csv(file="/home/aldi/R-Dev/HeatMapper_v0.1/4_3D_plotting/data/data.csv", header=TRUE, sep=",",quote = "",row.names = NULL, stringsAsFactors = FALSE)
z <- MyData$data_1
x <- MyData$lat
y <- MyData$lon
id <- MyData$ID_1

mydata <- data.frame(x,y,z,id)
mydata <- mydata[order(mydata$x),]
z_sorted <- mydata$z
z = matrix(z_sorted,nrow=5, ncol=5)
num_data <- which.max(id)
num_data <- sqrt(num_data)
num_data<- trunc(num_data)
num_data
z_sorted
z = matrix(z_sorted,nrow=num_data, ncol=num_data)

#-----------------------------------------------------------------------#
#--- prepare data ---#
#-----------------------------------------------------------------------#
trace1 <- list(
  z = matrix(z_sorted,nrow=num_data, ncol=num_data), 
  colorscale = list(c(0, "#398724"),list(0.1, "#f2ef3c"),list(0.2, "#f2ef3c"),list(0.3, "#94c06d"),list(0.4, "#b6d079"),list(0.5, "#d7de84"),list(0.6, "#c9c370"),list(0.7, "#bba65b"),list(0.8, "#ad8a47"),list(0.9, "#9f6d32"),list(1, "#91511e")), 
  #colorscale = "Rainbow", 
  type = "surface", 
  uid = "b12f78", 
  zmax = max(z_sorted, na.rm=TRUE), 
  zmin = min(z_sorted, na.rm=TRUE)
)
data <- list(trace1)
layout <- list(
  height = 600, 
  scene = list(
    aspectratio = list(
      x = 1, 
      y = 1, 
      z = 1
    ), 
    camera = list(
      center = list(
        x = 0, 
        y = 0, 
        z = 0
      ), 
      eye = list(
        x = 1.34721415304, 
        y = 0.914438846295, 
        z = 1.42699531262
      ), 
      up = list(
        x = 0, 
        y = 0, 
        z = 1
      )
    ), 
    xaxis = list(
      backgroundcolor = "rgb(230, 230,230)", 
      gridcolor = "rgb(255, 255, 255)", 
      showbackground = TRUE, 
      type = "linear", 
      zerolinecolor = "rgb(255, 255, 255)"
    ), 
    yaxis = list(
      backgroundcolor = "rgb(230, 230,230)", 
      gridcolor = "rgb(255, 255, 255)", 
      showbackground = TRUE, 
      type = "linear", 
      zerolinecolor = "rgb(255, 255, 255)"
    ), 
    zaxis = list(
      backgroundcolor = "rgb(230, 230,230)", 
      gridcolor = "rgb(255, 255, 255)", 
      showbackground = TRUE, 
      zerolinecolor = "rgb(255, 255, 255)"
    )
  ), 
  title = "Batello", 
  width = 600
)
p <- plot_ly()
p <- add_trace(p, z=trace1$z, colorscale=trace1$colorscale, type=trace1$type, uid=trace1$uid, zmax=trace1$zmax, zmin=trace1$zmin)
p <- layout(p, height=layout$height, scene=layout$scene, title=layout$title, width=layout$width)
p