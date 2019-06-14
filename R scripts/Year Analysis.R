# Checking for years for each stock
# Created by Kelly Mistry, kelly.r.mistry@gmail.com
# Last revised: 6/11/2019

library(here)

load(here::here("/Data/RAM v4.40 (7-1-18)/DB Files With Assessment Data/DBdata.RData"))

timeseries_v4.40 <- timeseries

stock_csv <- read.csv(here::here("/Data/RAM Files (v4.44)/ram tables/stock.csv"))

timeseries_v4.44 <- read.csv(here::here("/Data/RAM Files (v4.44)/ram tables/timeseries.csv"))

stockid_of_interest <- c("COD2J3KL", "SARDPCOAST", "PANCHPERUNC", "PHALNPAC", 
                         "HERRNORSS", "WPOLLEBS", "PILCHPJPN", "ATBTUNAEATL", 
                         "CODIIIaW-IV-VIId", "SSALMIGUSHIK", "SSALMNUSHAGAK", 
                         "SSALMTOGIAK", "SSALMKVICHAK", "SSALMNAKNEK", "SSALMEGEGIK",
                         "SSALMUGASHIK", "SSALMWOOD")
stocklong_of_interest <- as.character(timeseries_v4.44$stocklong[match(stockid_of_interest, 
                                                                       timeseries_v4.44$stockid)])


classic_stock_timeseries_list_4.44 <- lapply(stockid_of_interest, function(x) {
  timeseries_v4.44[timeseries_v4.44$stockid == x, ]
  })
names(classic_stock_timeseries_list_4.44) <- stocklong_of_interest

summary_data_4.44 <- lapply(classic_stock_timeseries_list_4.44, function(x) {
  number_of_assessments <- length(unique(x$assessid))
  year_min <- min(x$tsyear)
  year_max <- max(x$tsyear)
  return(list(number_of_assessments = number_of_assessments, 
              year_min = year_min, year_max = year_max))
})

names(summary_data_4.44) <- stocklong_of_interest


# classic_stock_timeseries_list_4.40 <- lapply(stockid_of_interest, function(x) {
#   timeseries_v4.40[timeseries_v4.40$stockid == x, ]
# })
# names(classic_stock_timeseries_list_4.40) <- stocklong_of_interest
# 
# summary_data_4.40 <- lapply(classic_stock_timeseries_list_4.40, function(x) {
#   number_of_assessments <- length(unique(x$assessid))
#   year_min <- min(x$tsyear)
#   year_max <- max(x$tsyear)
#   return(list(number_of_assessments = number_of_assessments, 
#               year_min = year_min, year_max = year_max))
# })
# 
# names(summary_data_4.40) <- stocklong_of_interest


# Unclear stockids:
# West Australia Rock Lobster - check with Mike (south australia northern or southern zone)



