# Course Project: Earthquake Seismicity Rates in Oklahoma
##This is a R Shiny App that will display the daily seismity rate for earthquakes occurring in the
state of Oklahoma for a time period specified by the user.  

###There are 2 ways to run the application.
1. Download the *R files - server.R and ui.R, and run them in RStudio.  You will need the Shiny libraries.
2. The app is hosted at: https://ellenyu.shinyapps.io/eqinput/

###The Data:
The data set the application uses is queried from the USGS ComCat Catalog.
The geographical limits of the data is: latitude 33.541 and 37.177 and longitude -103.256 and -94.203

###The User provides two inputs - 
1. a start date, which can be hand entered or by the calendar widget.
2. The number of days to search after the start date.  The limit is 3650 days (~10 years).
