# res2map
R function to save the residuals of a linear model in a 2D map

### Load texture.RData
load('/tmp/texture.RData' )

### Transform SpatialGridDataFrame layers in RasterLayers; the function wants RasterLayer objects as input. A stack of RasterLayer must be used in case more than one predictor is needed.
a <- raster(textureset,layer="texture_SE",values=T)
b <- raster(textureset,layer="texture_SA",values=T)
c <- raster(textureset,layer="texture_Contr",values=T)

### Run the function with one predictor
bla<-res2map(inRRaster=a,inPRaster=b,outResRaster=out,plot=TRUE)

### Run the function with more than one predictor
bla<-res2map(inRRaster=a,inPRaster=raster::stack(b,c),outResRaster=out,plot=TRUE)

### Plot only the residuals
raster::plot(bla)
