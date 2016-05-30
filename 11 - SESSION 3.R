#######################
# Assign library

require("httr")||install.packages("httr")
require("RCurl")||install.packages("RCurl")
require("jsonlite")||install.packages("jsonlite")
require("lubridate")||install.packages("lubridate")

library("httr")
library("RCurl")
library("jsonlite")
library("lubridate")

### Weather API connect and pull data ###

# In case you're using a proxy server for web connecting...
# curl <- getCurlHandle()
# curlSetOpt(.opts = list(proxy = '172.16.3.196:3128'), curl = curl)

############################
# 1 - Open weather data base api
# signup @ http://home.openweathermap.org/users/sign_up and get the api key (refer url1 below - 34ea8871014f1307420017c55113b855
# refer documentation for accessing  all features of api @ http://openweathermap.org/api
# add &units=metric in url if you want units in metric system for temperature
# 

url1 = "http://api.openweathermap.org/data/2.5/forecast/daily/?id=1269843&cnt=15&APPID=34ea8871014f1307420017c55113b855" #forcast for Hyderabad id=1269843
t = Sys.time()
forcast = getURL(url1) #,curl = curl)
forcast1 <- jsonlite::fromJSON(forcast)
forcast1$list$dt = as.POSIXct(     # Date-time Conversion Function
  forcast1$list$dt,      # date object to be converted
  origin = '1970-01-01', 
  tz='GMT')              # tz = timezone
Sys.time() - t

forcast2 = forcast1$list	
weather = unlist(
  sapply(	
    sapply(forcast2$weather, "[", i = 3),
    "[", i = 1));

forcast3 = data.frame(forcast2$dt, 
                      forcast2$temp,
                      forcast2$pressure,
                      forcast2$humidity,
                      forcast2$speed,
                      forcast2$deg,
                      forcast2$clouds,
                      weather)

write.csv(forcast3,"Hyderabad_weather_forcast.csv",row.names = F,)    # save in csv form


################### Wikepedia connect ##########

require("wikipediatrend")||install.packages("wikipediatrend")
require("ggplot2")||install.packages("ggplot2")

library("wikipediatrend")
library("ggplot2")

t = Sys.time()                            # start clock
nestle = wp_trend(                        # func wp_trend() builds a data object - nestle
  "Nestle",               # search term is "Nestle"
  from = "2014-01-01", 
  to = prev_month_end())
Sys.time() - t                            # how long did the DC op take?  

dim(nestle);    head(nestle)


t = Sys.time()                            # start clock
maggi = wp_trend(                        # func wp_trend() builds a data object - nestle
  "Maggi",               # search term is "Nestle"
  from = "2014-01-01",   to = prev_month_end())
Sys.time() - t                            # how long did the DC op take?  

dim(maggi);     head(maggi)

lead_pois = wp_trend("Lead_poisoning", 
                     from = "2014-01-01", 
                     to = prev_month_end())

dim(lead_pois);    head(lead_pois)

# jpeg("wiki tren.Jpeg", height = 700, width = 1100, quality = 400)
ggplot(data = nestle, 
       aes(x = date, y = count)) + 
  
  geom_bar(stat = "identity",      # what's this?
           fill = "grey", 
           colour = "red")+
  
  geom_bar(data = lead_pois, 
           aes(x = date, y = count),
           stat = "identity", fill = "grey", colour = "blue")  # same as above

# dev.off()

dcomp = rbind(nestle,lead_pois, maggi);

ggplot(dcomp) + 
  
  geom_line(aes(x = date, y = count, 
                colour = title)) +
  
  scale_colour_manual(values = c("red", "blue", "black"))


#############################
# 2 - open movie data base API
# No API key required
# Support two types of queries by serach and move imdb id

a = getURL("http://www.omdbapi.com/?s=harry%20%potter&r=json") # search for harry potter
b = getURL("http://www.omdbapi.com/?i=tt1201607&r=json&tomatoes=true") # serach for imdb id tt1201607 ("Harry Potter and the Deathly Hallows: Part 2")

x <- jsonlite::fromJSON(a)
y <- jsonlite::fromJSON(b)

x
y

# BTW IMDB provides data in txt file of its database
# ftp://ftp.fu-berlin.de/pub/misc/movies/database/