# Get this figure: fig <- get_figure("MattSundquist", 2065)
# Get this figure's data: data <- get_figure("MattSundquist", 2065)$data
# Add data to this figure: p <- add_trace(p, x=c(4, 5), y=c(4, 5), kwargs=list(filename="Mount Bruno", fileopt="extend"))
# Get z data of first trace: z1 <- get_figure("MattSundquist", 2065)$data[[1]]$z

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




trace1 <- list(
  z = matrix(z_sorted,nrow=num_data, ncol=num_data), 
  colorscale = "Rainbow", 
  type = "surface", 
  uid = "b12f78"
)
data <- list(trace1)
layout <- list(
  autosize = FALSE, 
  bargap = 0.2, 
  bargroupgap = 0, 
  barmode = "group", 
  boxgap = 0.3, 
  boxgroupgap = 0.3, 
  boxmode = "overlay", 
  dragmode = "zoom", 
  font = list(
    color = "#444", 
    family = "\"Open sans\", verdana, arial, sans-serif", 
    size = 12
  ), 
  height = 800, 
  hidesources = FALSE, 
  hovermode = "x", 
  legend = list(
    bgcolor = "#fff", 
    bordercolor = "#444", 
    borderwidth = 0, 
    font = list(
      color = "", 
      family = "", 
      size = 0
    ), 
    traceorder = "normal"
  ), 
  margin = list(
    r = 20, 
    t = 100, 
    autoexpand = TRUE, 
    b = 20, 
    l = 20, 
    pad = 0
  ), 
  paper_bgcolor = "#fff", 
  plot_bgcolor = "#fff", 
  scene = list(
    bgcolor = "rgb(238, 247, 249)", 
, 
    domain = list(
      x = c(0, 1), 
      y = c(0, 1)
    ), 
    xaxis = list(
      autorange = TRUE, 
      backgroundcolor = "rgba(204, 204, 204, 0.5)", 
      dtick = 100, 
      exponentformat = "B", 
      gridcolor = "rgb(255, 255, 255)", 
      gridwidth = 1, 
      linecolor = "rgb(255, 255, 255)", 
      linewidth = 1, 
      mirror = FALSE, 
      nticks = 0, 
      range = c(1, 482), 
      rangemode = "normal", 
      showaxeslabels = TRUE, 
      showbackground = FALSE, 
      showexponent = "all", 
      showgrid = TRUE, 
      showline = TRUE, 
      showspikes = TRUE, 
      showticklabels = TRUE, 
      spikesides = TRUE, 
      spikethickness = 1.1, 
      tick0 = 0, 
      tickangle = "auto", 
      tickcolor = "#444", 
      tickfont = list(
        color = "rgb(204, 204, 204)", 
        family = "", 
        size = 0
      ), 
      ticklen = 0, 
      ticks = "", 
      tickwidth = 1, 
      titlefont = list(
        color = "rgb(204, 204, 204)", 
        family = "", 
        size = 0
      ), 
      type = "linear", 
      zeroline = TRUE, 
      zerolinecolor = "rgb(255, 255, 255)", 
      zerolinewidth = 1
    ), 
    yaxis = list(
      autorange = TRUE, 
      backgroundcolor = "rgba(204, 204, 204, 0.5)", 
      dtick = 100, 
      exponentformat = "B", 
      gridcolor = "rgb(255, 255, 255)", 
      gridwidth = 1, 
      linecolor = "rgb(255, 255, 255)", 
      linewidth = 1, 
      mirror = FALSE, 
      nticks = 0, 
      range = c(1, 463), 
      rangemode = "normal", 
      showaxeslabels = TRUE, 
      showbackground = FALSE, 
      showexponent = "all", 
      showgrid = TRUE, 
      showline = TRUE, 
      showspikes = TRUE, 
      showticklabels = TRUE, 
      spikesides = TRUE, 
      spikethickness = 1.1, 
      tick0 = 0, 
      tickangle = "auto", 
      tickcolor = "#444", 
      tickfont = list(
        color = "rgb(204, 204, 204)", 
        family = "", 
        size = 0
      ), 
      ticklen = 0, 
      ticks = "", 
      tickwidth = 1, 
      titlefont = list(
        color = "rgb(204, 204, 204)", 
        family = "", 
        size = 0
      ), 
      type = "linear", 
      zeroline = TRUE, 
      zerolinecolor = "rgb(255, 255, 255)", 
      zerolinewidth = 1
    ), 
    zaxis = list(
      autorange = TRUE, 
      backgroundcolor = "rgba(204, 204, 204, 0.5)", 
      dtick = 100, 
      exponentformat = "B", 
      gridcolor = "rgb(255, 255, 255)", 
      gridwidth = 1, 
      linecolor = "rgb(255, 255, 255)", 
      linewidth = 1, 
      mirror = FALSE, 
      nticks = 0, 
      range = c(-0.958128094673, 396.65020752), 
      rangemode = "normal", 
      showaxeslabels = TRUE, 
      showbackground = FALSE, 
      showexponent = "all", 
      showgrid = TRUE, 
      showline = TRUE, 
      showspikes = TRUE, 
      showticklabels = TRUE, 
      spikesides = TRUE, 
      spikethickness = 1.1, 
      tick0 = 0, 
      tickangle = "auto", 
      tickcolor = "#444", 
      tickfont = list(
        color = "rgb(204, 204, 204)", 
        family = "", 
        size = 0
      ), 
      ticklen = 0, 
      ticks = "", 
      tickwidth = 1, 
      titlefont = list(
        color = "rgb(204, 204, 204)", 
        family = "", 
        size = 0
      ), 
      type = "linear", 
      zeroline = TRUE, 
      zerolinecolor = "rgb(255, 255, 255)", 
      zerolinewidth = 1
    )
  ), 
  separators = ".,", 
  showlegend = FALSE, 
  smith = FALSE, 
  title = "Mount Bruno", 
  titlefont = list(
    color = "", 
    family = "", 
    size = 0
  ), 
  width = 900
)
p <- plot_ly()
p <- add_trace(p, z=trace1$z, colorscale=trace1$colorscale, type=trace1$type, uid=trace1$uid)
p <- layout(p, autosize=layout$autosize, bargap=layout$bargap, bargroupgap=layout$bargroupgap, barmode=layout$barmode, boxgap=layout$boxgap, boxgroupgap=layout$boxgroupgap, boxmode=layout$boxmode, dragmode=layout$dragmode, font=layout$font, height=layout$height, hidesources=layout$hidesources, hovermode=layout$hovermode, legend=layout$legend, margin=layout$margin, paper_bgcolor=layout$paper_bgcolor, plot_bgcolor=layout$plot_bgcolor, scene=layout$scene, separators=layout$separators, showlegend=layout$showlegend, smith=layout$smith, title=layout$title, titlefont=layout$titlefont, width=layout$width)
p