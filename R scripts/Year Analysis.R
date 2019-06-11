# Checking for years for each stock
# Created by Kelly Mistry, kelly.r.mistry@gmail.com
# Last revised: 6/11/2019

stock_csv <- read.csv("stock.csv")

timeseries <- read.csv("timeseries.csv")

indices <- c(grep("Australia Rock Lobster", temp$stocklong), grep("Australia Rock Lobster", temp$stocklong))

stockid_of_interest <- c("COD2J3KL", "SARDPCOAST", "PANCHPERUNC", "PHALNPAC", 
                         "HERRNORSS", "WPOLLEBS", "PILCHPJPN", "ATBTUNAEATL")


classic_stock_timeseries_list <- lapply(stockid_of_interest, function(x) {
  timeseries[timeseries$stockid == x, ]
  })

summary_data <- lapply(classic_stock_timeseries_list, function(x) {
  number_of_assessments <- length(unique(x$assessid))
  year_min <- min(x$tsyear)
  year_max <- max(x$tsyear)
  return(list(number_of_assessments = number_of_assessments, 
              year_min = year_min, year_max = year_max))
})

# Unclear stockids:
# Bristol Bay Sockeye Salmon - check with Mike (may be more than 1 stockid)
# West Australia Rock Lobster - check with Mike (south australia northern or southern zone)
# North Sea Cod - centered on subarea IV - check with Mike (CODIIIaW-IV-VIId?)



