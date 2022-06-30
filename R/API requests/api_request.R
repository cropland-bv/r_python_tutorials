
# Packages ----------------------------------------------------------------

library(httr)
library(dplyr)
library(readr)

  
# Extract --------------------------------------------------------------------

url <- paste0("https://api.polygon.io/v1/open-close/TSLA/2021-11-05")
arguments <- list(apiKey = "OMcTE5UfoH9CLldh8d_pfVMQfOrz73Mo")

# make api request
r <- GET(url, query = arguments)

# extract content from request
r <- content(r)


# Transform ---------------------------------------------------------------

# transform list to data frame
r <- bind_rows(r)

# select subset of attributes
r <- r %>% select(date = from, open, close, high, low)


# Load --------------------------------------------------------------------

write_csv(r, "Tesla.csv", append = TRUE, col_names = TRUE)
