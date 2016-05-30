library("RCurl")
library("jsonlite")
library("plotGoogleMaps")
library("geosphere")
 
key = "AIzaSyBAqhOKSQtlgOzG_Oci06RZsavFc7wD_AY"

# malls search
url = paste0("https://maps.googleapis.com/maps/api/place/radarsearch/json?&query=malls+in+hyderabad&types=shopping_mall&location=17.3700,78.4800&radius=50000&key=",key)
doc <- getURL(url)
x <- jsonlite::fromJSON(doc)
malls = x$results$geometry$location
head(malls)

# hospitals
url = paste0("https://maps.googleapis.com/maps/api/place/radarsearch/json?&query=hospitals+in+hyderabad&types=hospital&location=17.3700,78.4800&radius=50000&key=",key)
doc <- getURL(url)
x <- jsonlite::fromJSON(doc)
hospitals = x$results$geometry$location
head(hospitals)

# banks
url = paste0("https://maps.googleapis.com/maps/api/place/radarsearch/json?&query=banks+in+hyderabad&types=bank&location=17.3700,78.4800&radius=50000&key=",key)
doc <- getURL(url)
x <- jsonlite::fromJSON(doc)
banks = x$results$geometry$location
head(banks)

malls$type = "Mall"
banks$type = "Bank"
hospitals$type = "Hospital"

data = rbind(malls,banks,hospitals)
dim(data)

write.csv(data,"hyderabad_places.csv", row.names = F)

###################################################################
###################################################################
###################################################################

# let's plot the malls and do clustering based on distance matrix

sample = malls
coordinates(sample) <-~ lng +lat # Create cordinates
proj4string(sample) = CRS('+proj=longlat +datum=WGS84') # Add Projections

m<-mcGoogleMaps(sample,zcol = "type", mapTypeId='ROADMAP') # Plot on Google maps



# Get the coordinates
p2 = malls[,2:1]

# calculate distances
dist_mat = matrix(0,nrow(p2),nrow(p2))

for (i in 1:nrow(p2)){
  for (j in 1:nrow(p2)){
    dist_mat[i,j] = distCosine(p2[i,],p2[j,], r=6378173)/1000    
  }
}

class(dist_mat)
dist_mat[1:10,1:10]

# Create clusters based in distances
fit <- hclust(as.dist(dist_mat), method="ward")
plot(fit) # display dendogram

groups <- cutree(fit, k=18) # cut tree into 18 clusters
# draw dendogram with red borders around the 18 clusters
rect.hclust(fit, k=18, border="red") 

sample$group = groups # Assign cluster groups

# Plot stores with clustor as label
m <- mcGoogleMaps(sample, mapTypeId='ROADMAP', zcol="group")


#########################################################
#########################################################
#########################################################

sample = data
coordinates(sample) <-~ lng +lat # Create cordinates
proj4string(sample) = CRS('+proj=longlat +datum=WGS84') # Add Projections

m<-mcGoogleMaps(sample,zcol = "type", mapTypeId='ROADMAP') # Plot on Google maps
