
library(dplyr)
library(readr)
library(tidyquant)


options("getSymbols.warning4.0"=FALSE)
options("getSymbols.yahoo.warning"=FALSE)

getSymbols("MSFT", from = '2021-01-01', to = "2021-11-01",
  warnings = FALSE, auto.assign = TRUE)

df <- as.data.frame(MSFT)
df$date <- rownames(df)

df %>% mutate(company = "Microsoft") %>%
  select(company, date, open = MSFT.Open, close = MSFT.Close,
    high = MSFT.High, low = MSFT.Low) %>%
  write_csv("history.csv", append=TRUE)
