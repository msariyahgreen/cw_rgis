library(tidyverse)
library(sf)
library(terra)
library(tidyterra)
spr_prec <- rast("data/spr_prec_us.tif")
spr_prec
ext(spr_prec)
spr_prec_crop <- crop(
  x = spr_prec,
  y = c(-80, -75, 34, 37)
)
spr_prec_crop
sf_nc_county <- readRDS("data/sf_nc_county.rds")
ggplot() +
  geom_spatraster(data = spr_prec_crop) +
  geom_sf(data = sf_nc_county, alpha = 0.25)
spr_prec_nc <- crop(
  x = spr_prec,
  y = sf_nc_county
)
ggplot() +
  geom_spatraster(data = spr_prec_nc) +
  geom_sf(data = sf_nc_county, alpha = 0.25)
spr_nw <- rast("data/spr_prec_ncnw.tif")
spr_ne <- rast("data/spr_prec_ncne.tif")
spr_sw <- rast("data/spr_prec_ncsw.tif")
spr_se <- rast("data/spr_prec_ncse.tif")
spr_nw
spr_n <- merge(spr_nw, spr_ne)
ggplot() +
  geom_spatraster(data = spr_n) +
  geom_sf(data = sf_nc_county, alpha = 0.25)
list_spr <- list(
  spr_nw,
  spr_ne,
  spr_sw,
  spr_se
)
spr_col <- sprc(list_spr)
spr_merge <- merge(spr_col)
ggplot() +
  geom_spatraster(data = spr_merge) +
  geom_sf(data = sf_nc_county, alpha = 0.25)
writeRaster(
  spr_merge,
  filename = "data/spr_prec_nc.tif",
  overwrite = TRUE
)
spr_prec_nc <- rast("data/spr_prec_nc.tif")
spr_tmp_nc <- rast("data/spr_tmp_nc.tif")
spr_prec_nc
spr_tmp_nc
spr_pt_nc <- c(
  spr_prec_nc,
  spr_tmp_nc
)
spr_pt_nc
spr_pt_nc$precipitation
spr_pt_nc$temperature
spr_prec_nc_proj <- project(
  x = spr_prec_nc,
  y = "EPSG:32617"
)
spr_prec_nc_proj
