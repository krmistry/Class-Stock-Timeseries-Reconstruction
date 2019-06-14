# Checking for years for each stock
# Created by Kelly Mistry, kelly.r.mistry@gmail.com
# Last revised: 6/11/2019

library(here)

stock_csv <- read.csv(here::here("/Data/RAM Files (v4.44)/ram tables/stock.csv"))

timeseries <- read.csv(here::here("/Data/RAM Files (v4.44)/ram tables/timeseries.csv"))

indices <- c(grep("Igushik", stock_csv$stocklong), 
             grep("Nushagak", stock_csv$stocklong),
             grep("Togiak", stock_csv$stocklong),
             grep("Kvichak", stock_csv$stocklong),
             grep("Naknek", stock_csv$stocklong),
             grep("Egegik", stock_csv$stocklong),
             grep("Ugashik", stock_csv$stocklong),
             grep("Wood", stock_csv$stocklong))

stockid_of_interest <- c("COD2J3KL", "SARDPCOAST", "PANCHPERUNC", "PHALNPAC", 
                         "HERRNORSS", "WPOLLEBS", "PILCHPJPN", "ATBTUNAEATL", 
                         "CODIIIaW-IV-VIId", "SSALMIGUSHIK", "SSALMNUSHAGAK", 
                         "SSALMTOGIAK", "SSALMKVICHAK", "SSALMNAKNEK", "SSALMEGEGIK",
                         "SSALMUGASHIK", "SSALMWOOD")
stocklong_of_interest <- timeseries$stocklong[match(stockid_of_interest, timeseries$stockid)]


classic_stock_timeseries_list <- lapply(stockid_of_interest, function(x) {
  timeseries[timeseries$stockid == x, ]
  })
names(classic_stock_timeseries_list) <- stocklong_of_interest

summary_data <- lapply(classic_stock_timeseries_list, function(x) {
  number_of_assessments <- length(unique(x$assessid))
  year_min <- min(x$tsyear)
  year_max <- max(x$tsyear)
  return(list(number_of_assessments = number_of_assessments, 
              year_min = year_min, year_max = year_max))
})

names(summary_data) <- stocklong_of_interest

# Unclear stockids:
# West Australia Rock Lobster - check with Mike (south australia northern or southern zone)



