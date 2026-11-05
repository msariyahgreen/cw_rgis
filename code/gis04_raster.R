if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               terra,
               tidyterra,
               mapview,
               stars)

(spr_ex <- rast("data/spr_example.tif"))
# overwrite = TRUE enables overwriting
writeRaster(x = spr_ex, 
            filename = "data/spr_elev.tif",
            overwrite = TRUE)
ggplot() +
  geom_spatraster(data = spr_ex)

star_ex <- st_as_stars(spr_ex)
mapview(star_ex)

v_elev <- values(spr_ex)
head(v_elev)
extract(spr_ex, y = cbind(6.0000, 50.0000))
(df_point <- tibble(lon = c(6, 5.9), lat = c(50, 49.96)))
extract(spr_ex, y = df_point)
## load forest raster
(spr_for <- rast("data/spr_forest_nc.tif"))
ggplot() +
  geom_spatraster(data = spr_for)
unique(spr_for)
unique(spr_for)
v_binary <- values(spr_for)
(p_forest <- mean(v_binary))
(spr_land <- rast("data/spr_land_reclass.tif"))
unique(spr_land)
extract(spr_land, cbind(-79.8063, 36.0701))
# write a conversion matrix
# left, original value
# right, value after conversion
(cm <- cbind(c(0, 1001, 1010, 1100),
             c(0, 1, 0, 0)))
spr_bin <- classify(spr_land,
                    rcl = cm)
v_bin <- values(spr_bin)
mean(v_bin)


# excersie-------------------------------------------------------------------
spr_prec_ncne <- rast("data/spr_prec_ncne.tif")
spr_prec_ncne
# The raster has 162 rows, 532 columns, and one layer.
# Each cell measures about 0.00833 degrees in both directions.
# Longitude ranges from -79.89181 to -75.45847.
# Latitude ranges from 35.24153 to 36.59153.
# The coordinate system is WGS 84 (EPSG:4326), using longitude and latitude.
# Precipitation values range from about 1063.10 to 1501.50.
ggplot() +
  geom_spatraster(data = spr_prec_ncne)
sf_site <- readRDS("data/sf_finsync_nc.rds")
df_xy <- sf::st_coordinates(sf_site)
df_land <- extract(spr_land, y = df_xy)
df_land
table(df_land[[1]])
# Forest is the most common land use, occurring at 111 of 122 sampling sites.

cm_urban <- cbind(c(0, 1001, 1010, 1100),
                  c(0, 0, 0, 1))

spr_urban <- classify(spr_land, rcl = cm_urban)

v_urban <- values(spr_urban)
(p_urban <- mean(v_urban))
# Approximately 3.17% of the land in this NC raster is urban.
spr_prec_ncne


