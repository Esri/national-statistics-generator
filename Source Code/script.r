# Install function for packages (automatic)
packages <- function(x){
  x <- as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

packages(RCurl)
packages(RJSONIO)
packages(httr)
packages(plyr)

# Method responsible for the ArcGIS Online request to generate a token
getToken <- function(username,password) {
  url = "https://arcgis.com/sharing/rest/generateToken"
  data = list('username'= username,
              'password'= password,
              'referer' = 'http://arcgis.com',
              'expiration' = 1209600,
              'f'= 'json')
  r<-POST(url,body = data)
  content(r)
  x <- fromJSON(content(r))
  token<-x$token
  return(token)
}

# Method that formats the point geometry array argument. Arguments are vector of type double and vector of type double.
toChunkedGeometryString <- function(lng, lat) {
  a <- vector(length=length(lat))
  for(i in 1:length(lat)) {
    a <- c(sprintf('{"geometry":{"x":%f,"y":%f},"areaType":"RingBuffer","bufferUnits":"esriMiles","bufferRadii":[%i],"returnGeometry":false}',lng,lat,buffer))
  }
  a <- paste(a, collapse=",")
  a <- paste('[',a,']',sep = "", collapse = NULL)
  return(a)
}

# Method responsible for formatting the web service query string.  Arguments are vector type double, vector type double, string.
url <- function(lng, lat, token) {
  geo = toChunkedGeometryString(lng,lat)
  studyAreas = URLencode(geo)
  #dataCollections = URLencode('["KeyUSFacts"]')
  dataCollections = URLencode(sprintf('["%s"]',datacollection))
  f = "json"
  token = token
  query_string = paste("?studyAreas=",studyAreas,"&dataCollections=",dataCollections,"&f=",f,"&token=",token,sep="")
  root <- "http://geoenrich.arcgis.com/arcgis/rest/services/World/geoenrichmentserver/GeoEnrichment/enrich"
  u <- paste(root,query_string,sep="")
  print(u) # Print the URL with query string to SPSS output console
  return(u)
}


# Method responsible for the HTTP ArcGIS Online service request.  Returns an Esri FeatureSet object expressed as a dataframe
executeGeoenrichRequest <- function(lng,lat,token){
  u <- url(lng,lat,token)
  doc <- getURL(u)
  x = fromJSON(doc,simplify = FALSE)
return(x)
}

badJsonReturned <- function(jsonData){
    if(length(jsonData$messages) !=0 || length(jsonData$results[[1]]$value$FeatureSet) ==0){
      return(TRUE)
    }
    return(FALSE)
}

#Method that takes single or lists of json data and returns the dataframe.
#if json fails test (error message or no features) then a frame of NAs will be returned
#else goes to populateColumnsWithData() which has additional error checking
singleDataFrame <- function(jsonData, fail_frame=empty_frame){

     if(badJsonReturned(jsonData)){#duplicate this check because it is looking at individual json not chunk level
        print(jsonData$messages)  
        current.df <- fail_frame
      } else {     
        featSet <- jsonData$results[[1]]$value$FeatureSet[[1]]$features
        current.df <- populateColumnsWithData(featSet)#creates frame with multiple rows of data based on input json
    }
    return(current.df)
}

# Method accepts the features JSON object (which is an array of feature objects) contained inside an Esri feature set.
# Returns a dataframe with dataframe rows less than or equal to the "chunkSize integer passed into batchGeoEnrich 
# Error checking - check if all columns in dataframe exist in the meta frame and apply intersection (if this doesn't happen different columns for location will cause failure)
populateColumnsWithData <- function(features){
  geo_data = data.frame()
  for(i in 1:length(features)){
    temp <- as.data.frame(features[[i]]) #dataframe within chunk
    common_cols <- intersect(colnames(temp), colnames(meta_frame)) #check that each df matches columns for meta data
    temp <- subset(temp, select=common_cols)#only keep columns with column in meta dataframe
    geo_data <- rbind.fill(geo_data,temp)#fill NAs for columns not matched
  }
  return(geo_data)
}

createDataFrames <- function(lng,lat,token){
  
  fullJson <- executeGeoenrichRequest(lng,lat,token)
  
   #checks for failure of chunk, then splits down request by location, then repeats check for each location to see where failure happened - singleDataFrame()
   if(badJsonReturned(fullJson)){ #check to see if the request failed or it was successful with no results
          latSingleList <- split(lat, ceiling(seq_along(lat)/1))
          lngSingleList <- split(lng, ceiling(seq_along(lng)/1))
          dataFrames <- vector(mode="list", length=length(latSingleList))
          
          for(i in 1:length(dataFrames)){
              latSingle <- as.numeric(unlist(latSingleList[i]))
              lngSingle <- as.numeric(unlist(lngSingleList[i]))
              singleJson <- executeGeoenrichRequest(lngSingle,latSingle,token)  
              singleDf <- singleDataFrame(singleJson)
              dataFrames[[i]] <- singleDf
          }
           return(rbind.fill(dataFrames))#return combined dataframe of individual rows- split due to failure
    }else{
       return(singleDataFrame(fullJson)) #return chunk dataframe - has multiple rows
        }    
    }


# Method accepts a longitude vector of type double, latitude vector of type double, an ArcGIS Online token of type string and a chunkSize integer less than 50.
# Returns a dataframe that is designed to satisfy the getMetaData modelerData parameter
batchGeoEnrich <- function(lng,lat,token,chunkSize){

  latChunks <- split(lat, ceiling(seq_along(lat)/chunkSize))
  lngChunks <- split(lng, ceiling(seq_along(lng)/chunkSize))
  fullFrames <- vector(mode="list", length=length(latChunks))

    for(i in 1:length(latChunks)){
       oneLatChunk <- as.numeric(unlist(latChunks[i]))
       oneLngChunk <- as.numeric(unlist(lngChunks[i]))
       chunkDf <- createDataFrames(oneLngChunk, oneLatChunk, token)
       fullFrames[[i]] <- chunkDf
    }
  
   return(rbind.fill(fullFrames))
}





# SPSS Model Inputs
lat = modelerData$%%lat%%
lng =  modelerData$%%long%%


# This function is used to generate automatically the dataModel for SPSS Modeler
getMetaData <- function (data) {
  if( is.null(dim(data)))
    stop("Invalid data received: not a data.frame")
  if (dim(data)[1]<=0) {
    print("Warning : modelerData has no line, all fieldStorage fields set to strings")
    getStorage <- function(x){return("string")}
  } else {
    getStorage <- function(x) {
      x <- unlist(x)
      res <- NULL
      #if x is a factor, typeof will return an integer so we treat the case on the side
      if(is.factor(x)) {
        res <- "string"
      } else {
        res <- switch(typeof(x),
                      integer="integer",
                      double = "real",
                      "string")
      }
      return (res)
    }
  }
  col = vector("list", dim(data)[2])
  for (i in 1:dim(data)[2]) {
    col[[i]] <- c(fieldName= chartr("._", "  ", names(data[i])), #gsub('\\.',' ',names(data[i])),c(fieldName=gsub('\\.','',names(data[i])),
                  fieldLabel="",
                  fieldStorage=getStorage(data[i]),
                  fieldMeasure="",
                  fieldFormat="",
                  fieldRole="")
  }

  mdm<-do.call(cbind,col)
print(mdm)
  mdm<-data.frame(mdm)
print(mdm)
  return(mdm)
}


username<- '%%username%%'
password<-'%%password%%'
datacollection<-'%%datacollection%%'
buffer <- as.numeric('%%buffer%%')
advanced.lng <- %%metaLongitude%%
advanced.lat <- %%metaLatitude%%
chunkSize <- %%chunkSize%%

# Operational Methods
token <- getToken(username, password)

#complete these steps first so we know if the initial Lat/Long gets any data -> 
u <- url(advanced.lng,advanced.lat,token)
doc <- getURL(u)
jsonMeta= fromJSON(doc,simplify = FALSE)


if(!badJsonReturned(jsonMeta)){
  featSet <- jsonMeta$results[[1]]$value$FeatureSet[[1]]$features
  meta_frame <- data.frame(featSet)
  num_cols <- dim(meta_frame)[2] #use this for check on each dataframe?
  empty_row <- rep(NA, num_cols)
  empty_frame <- data.frame(t(empty_row))
  colnames(empty_frame) <- colnames(meta_frame)
  
  mdm <- getMetaData(meta_frame)
  modelerDataModel <- data.frame(modelerDataModel,mdm)
  
  print(dim(modelerDataModel)) 
  length(lng)
  filled <- batchGeoEnrich(lng,lat,token, chunkSize)
print(dim(filled)) 
  modelerData<-cbind(modelerData, filled)
print(dim(modelerData))
}else{
  print('Issue with establishing meta data.  Please enter new coordinatse on tab 2 and refer to documentation.')
}