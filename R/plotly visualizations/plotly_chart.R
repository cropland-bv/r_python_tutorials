
# Packages ----------------------------------------------------------------

library(plotly)
library(readr)


# Read Data ---------------------------------------------------------------

df <- read_csv("history.csv")


# Line Chart --------------------------------------------------------------

fig <- plot_ly(data = filter(df, company == "Tesla"), x = ~date, y = ~close, name = 'Tesla', type = 'scatter', mode = 'lines',
        line = list(color = 'red', width = 4)) 
fig <- fig %>% add_trace(data = filter(df, company == "Amazon"), y = ~close, name = 'Amazon', line = list(color = 'darkblue', width = 4)) 
fig <- fig %>% add_trace(data = filter(df, company == "Apple"), y = ~close, name = 'Apple', line = list(color = 'darkgreen', width = 4)) 
fig <- fig %>% add_trace(data = filter(df, company == "Microsoft"), y = ~close, name = 'Microsoft', line = list(color = 'purple', width = 4)) 
fig <- fig %>% layout(title = "Tech Stock Prices", yaxis = list(title = "Price ($)"))

fig

# Line Chart --------------------------------------------------------------

fig <- plot_ly(df, x = ~date, y = ~open, name = 'Open', type = 'scatter', mode = 'lines',
        line = list(color = 'red', width = 4)) 
fig <- fig %>% add_trace(y = ~close, name = 'Close', line = list(color = 'darkblue', width = 4)) 
fig <- fig %>% add_trace(y = ~high, name = 'High', line = list(color = 'red', width = 4, dash = 'dash')) 
fig <- fig %>% add_trace(y = ~low, name = 'Low', line = list(color = 'darkblue', width = 4, dash = 'dash')) 
fig <- fig %>% layout(title = "Tesla Stock Prices", yaxis = list(title = "Price ($)"))

fig


# Candlestick Chart -------------------------------------------------------

fig <- df %>% plot_ly(x = ~date, type="candlestick",
          open = ~open, close = ~close,
          high = ~high, low = ~low) 
fig <- fig %>% layout(title = "Tesla Stock Prices")

fig
