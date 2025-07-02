library(shiny)
library(shinydashboard)
library(ggplot2)
library(gapminder)
library(dplyr)
library(DT)

# UI
ui <- dashboardPage(
  dashboardHeader(title = "🌍 Gapminder Explorer"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Scatter Plot", tabName = "plot", icon = icon("chart-line")),
      menuItem("Summary Stats", tabName = "summary", icon = icon("table")),
      menuItem("Data Table", tabName = "table", icon = icon("th"))
    ),
    
    sliderInput("year", "Select Year:",
                min = min(gapminder$year),
                max = max(gapminder$year),
                value = 2007,
                step = 5,
                sep = ""),
    
    selectInput("continent", "Select Continent(s):",
                choices = unique(gapminder$continent),
                selected = unique(gapminder$continent),
                multiple = TRUE)
  ),
  
  dashboardBody(
    tabItems(
      tabItem("plot",
              fluidRow(
                box(title = "GDP vs Life Expectancy",
                    width = 12, status = "primary", solidHeader = TRUE,
                    plotOutput("scatterPlot", height = "450px"))
              )
      ),
      tabItem("summary",
              fluidRow(
                box(title = "Summary Statistics",
                    width = 6, status = "info", solidHeader = TRUE,
                    verbatimTextOutput("summaryStats"))
              )
      ),
      tabItem("table",
              fluidRow(
                box(title = "Filtered Data Table",
                    width = 12, status = "success", solidHeader = TRUE,
                    DT::dataTableOutput("dataTable"))
              )
      )
    )
  )
)

# Server
server <- function(input, output, session) {
  
  filteredData <- reactive({
    gapminder %>%
      filter(year == input$year, continent %in% input$continent)
  })
  
  output$scatterPlot <- renderPlot({
    ggplot(filteredData(), aes(x = gdpPercap, y = lifeExp, color = continent)) +
      geom_point(size = 3, alpha = 0.7) +
      scale_x_log10() +
      theme_minimal() +
      labs(title = paste("GDP vs Life Expectancy in", input$year),
           x = "GDP per Capita (log scale)",
           y = "Life Expectancy")
  })
  
  output$summaryStats <- renderPrint({
    data <- filteredData()
    summary <- data %>%
      summarise(
        Countries = n(),
        Mean_GDP = mean(gdpPercap),
        Mean_LifeExp = mean(lifeExp)
      )
    print(summary)
  })
  
  output$dataTable <- DT::renderDataTable({
    filteredData()
  })
}

# Run the app
shinyApp(ui, server)

