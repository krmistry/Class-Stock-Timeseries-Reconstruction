# Checking for years for each stock
# Created by Kelly Mistry, kelly.r.mistry@gmail.com
# Last revised: 6/11/2019

stock_csv <- read.csv("stock.csv")

indices <- c(grep("Australia Rock Lobster", temp$stocklong), grep("Australia Rock Lobster", temp$stocklong))

stockid_of_interest <- c("COD2J3KL", "SARDPCOAST", "PANCHPERUNC", "PHALNPAC", 
                         "HERRNORSS", "WPOLLEBS", "PILCHPJPN", "ATBTUNAEATL")


# Unclear stockids:
# Bristol Bay Sockeye Salmon - check with Mike (may be more than 1 stockid)
# West Australia Rock Lobster - check with Mike (south australia northern or southern zone)
# North Sea Cod - centered on subarea IV - check with Mike (CODIIIaW-IV-VIId?)



