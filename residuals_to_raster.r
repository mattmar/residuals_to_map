res2map<-function(inRRaster,inPRaster,outResRaster,plot=TRUE){

#Required packages
    require(raster)

#Check if predictors are raster or stack objects
    if(is(inRRaster,"RasterLayer")==FALSE & is(inRRaster,"RasterStack")==FALSE | is(inPRaster,"RasterLayer")==FALSE & is(inPRaster,"RasterStack")==FALSE ) {
        stop("InPRaster and inRRaster must be RasterLayer or RasterStack")
    }
#Fit the linear model
    lmras<-lm(as.formula(paste("getValues(inRRaster) ~ ", paste("getValues(inPRaster)", collapse= "+"))),na.action=na.exclude)
#Assign the residuals to a new raster map
    out<-raster(matrix(residuals(lmras)),template=inPRaster)
#Plot response and residual if plot=TRUE
    if(plot==TRUE){
        par(mfrow=c(1,2))
        raster::plot(inRRaster,main="Response Raster Map")
        raster::plot(out,main="Residual Raster Map")
    }
    return(out)
}
