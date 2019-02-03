library('marmap')
getNOAA.bathy(lon1 = 140, lon2 = 155, lat1 = -13, lat2 = 0, resolution = 10) -> papoue
depth = sample(seq(-3000, -1000, by = 50), size = 16)
x = c(142.1390, 142.9593, 144.0466, 145.9141,145.9372, 146.0115, 145.9141, 146.8589,146.6651, 147.1772, 147.2856, 152.7475,152.5025, 152.7816, 152.9010, 153.2314)
y = c(-2.972065, -3.209449, -3.391399, -4.675720,-4.914153, -5.130116, -5.329641, -2.587792,-2.897221, -3.250368, -2.720080, -6.005769,-6.211152, -6.326915, -5.990206, -6.023344)
data.frame(x, y, depth) -> sp
names(sp) <- c("lon", "lat", "depth")
par(mai=c(1,1,1,1.5))
plot(papoue, deep = c(-4500, 0), shallow = c(-50, 0), step = c(500, 0),
    lwd = c(0.3, 1), lty = c(1, 1), col = c("grey", "black"),drawlabels = c(FALSE, FALSE))
scaleBathy(papoue, deg = 3, x = "bottomleft", inset = 5)
max(-depth, na.rm = TRUE) -> mx
colorRampPalette(c("white", "lightyellow", "lightgreen","blue", "lightblue1", "purple")) -> ramp
blues <- ramp(mx)
points(sp[,1:2], col = "black", bg = blues[-depth],pch = 21, cex = 1.5)
require(shape)
colorlegend(zlim = c(mx, 0), col = rev(blues), main = "depth (m)",posx = c(0.85, 0.88))