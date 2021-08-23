#--- Load Packages ---
install.packages("ggmap")
install.packages("maps")
install.packages("mapproj")
install.packages("mapdata")
install.packages("rgeos")
install.packages("maptools")
install.packages("sp")
install.packages("raster")
install.packages("rgdal")
install.packages("dismo")

require(ggmap)
require(maps)
require(mapproj)
require(mapdata)
require(rgeos)
require(maptools)
require(sp)
require(raster)
require(rgdal)
require(dismo)

require(devtools)
devtools::install_github("dkahle/ggmap", ref = "tidyup")25


#sitemap

BrentonSites <- read.csv(file="Coralline_sites_2020.csv",
                         header           = TRUE,
                         stringsAsFactors = TRUE)

str(BrentonSites)

range(BrentonSites$Dec.Lat)
range(BrentonSites$Dec.Long)



translocation <- BrentonSites[-c(6,7,8), ]

base = get_map(location=c(-127.9,51.7,-128.2,51.6),source="stamen", 
                      maptype="terrain",crop = FALSE, zoom=10)


map <- ggmap(base) 

map


MapPlot<- map + 
  geom_point(data=BrentonSites, aes(x=Dec.Long, y=Dec.Lat, col=Type, shape=Type), size =4) +
  scale_color_manual(values = c("#003366", "#990000", "#009E73")) +
  
  #make line around plot
  labs(x="Latitude", y="Longitude") + # label the axes
  theme_set(theme_classic(base_size = 12)) + 
  theme(legend.title=element_blank(), legend.justification=c(0,1), legend.position=c(0.6,0.9), legend.text = element_text(size = 16)) 

MapPlot<- map + 
  geom_point(data=translocation, aes(x=Dec.Long, y=Dec.Lat, col=Type, shape=Type), size =4) +
  scale_color_manual(values = c("#003366", "#990000", "#009E73")) +
  
  #make line around plot
  labs(x="Latitude", y="Longitude") + # label the axes
  theme_set(theme_classic(base_size = 12)) + 
  theme(legend.title=element_blank(), legend.justification=c(0,1), legend.position=c(0.6,0.9), legend.text = element_text(size = 16)) 
# tweak the plot's appearance and legend position

MapPlot

Plot_print <- ggsave(plot = MapPlot, width = 6, height = 6, dpi = 600, filename = "Boulder_map.png")



