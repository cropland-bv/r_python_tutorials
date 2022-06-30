
library(shiny)
library(plotly)
library(dplyr)
library(readr)

# data inlezen
df <- read_csv("history.csv")

ui <- fluidPage(

    titlePanel("Stock Prices"),

    sidebarLayout(
        sidebarPanel(width = 3,
            dateRangeInput("range",
                        "Date:",
                        min = min(df$date),
                        max = max(df$date),
                        start = min(df$date),
                        end = max(df$date)
                        ),
            selectizeInput("company",
                        "Company:",
                        choices = c("Amazon", "Tesla", "Microsoft", "Apple"),
                        selected = "Tesla"
                        )
        ),

        mainPanel(
           plotlyOutput("plot", height = "800px")
        )
    )
)

server <- function(input, output) {

    output$plot <- renderPlotly({
        data <- df %>% filter(date >= input$range[1] & date <= input$range[2] & company == input$company)

        fig <- data %>% plot_ly(x = ~date, type="candlestick",
                  open = ~open, close = ~close,
                  high = ~high, low = ~low) 
        fig <- fig %>% layout(title = paste(input$company, "Stock Prices"), yaxis = list(title = "Price ($)"))
        
        fig
    })
}

# app starten
shinyApp(ui = ui, server = server)
