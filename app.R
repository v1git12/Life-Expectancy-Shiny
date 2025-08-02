# Enhanced Shiny Gapminder Dashboard with KPIs & Charts

library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(gapminder)
library(DT)

# Precompute summary metrics
global_summary <- gapminder %>%
  group_by(year) %>%
  summarise(
    total_countries = n_distinct(country),
    highest_lifeExp = max(lifeExp),
    lowest_lifeExp = min(lifeExp),
    highest_gdp = max(gdpPercap),
    lowest_gdp = min(gdpPercap)
  )

ui <- dashboardPage(
  dashboardHeader(title = "🌍 Gapminder Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("KPIs & Overview", tabName = "dashboard", icon = icon("tachometer-alt")),
      menuItem("GDP Trends", tabName = "gdp", icon = icon("chart-line")),
      menuItem("Life Expectancy", tabName = "life", icon = icon("heartbeat")),
      menuItem("Data Table", tabName = "table", icon = icon("table"))
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
      
      tabItem(tabName = "dashboard",
              fluidRow(
                valueBoxOutput("totalCountries"),
                valueBoxOutput("highestGDP"),
                valueBoxOutput("highestLife")
              ),
              fluidRow(
                box(title = "GDP Distribution by Continent", width = 6, status = "primary",
                    plotOutput("gdpBarPlot")),
                box(title = "Life Expectancy by Continent", width = 6, status = "success",
                    plotOutput("lifePiePlot"))
              )
      ),
      
      tabItem(tabName = "gdp",
              fluidRow(
                box(title = "Average GDP per Continent", width = 12, status = "info",
                    plotOutput("gdpAreaPlot"))
              )
      ),
      
      tabItem(tabName = "life",
              fluidRow(
                box(title = "Life Expectancy Trend by Continent", width = 12, status = "warning",
                    plotOutput("lifeLinePlot"))
              )
      ),
      
      tabItem(tabName = "table",
              fluidRow(
                box(title = "Filtered Data Table", width = 12, status = "success",
                    DTOutput("dataTable"))
              )
      )
    )
  )
)

server <- function(input, output, session) {
  
  filteredData <- reactive({
    gapminder %>%
      filter(year == input$year, continent %in% input$continent)
  })
  
  output$totalCountries <- renderValueBox({
    valueBox(
      filteredData() %>% summarise(n = n_distinct(country)) %>% pull(n),
      "Total Countries", icon = icon("globe"), color = "aqua"
    )
  })
  
  output$highestGDP <- renderValueBox({
    valueBox(
      round(max(filteredData()$gdpPercap), 2),
      "Highest GDP per Capita", icon = icon("dollar-sign"), color = "green"
    )
  })
  
  output$highestLife <- renderValueBox({
    valueBox(
      round(max(filteredData()$lifeExp), 1),
      "Highest Life Expectancy", icon = icon("heartbeat"), color = "red"
    )
  })
  
  output$gdpBarPlot <- renderPlot({
    filteredData() %>%
      group_by(continent) %>%
      summarise(avg_gdp = mean(gdpPercap)) %>%
      ggplot(aes(x = continent, y = avg_gdp, fill = continent)) +
      geom_bar(stat = "identity") +
      labs(y = "Avg GDP", x = "Continent") +
      theme_minimal()
  })
  
  output$lifePiePlot <- renderPlot({
    data <- filteredData() %>%
      group_by(continent) %>%
      summarise(avg_life = mean(lifeExp))
    
    ggplot(data, aes(x = "", y = avg_life, fill = continent)) +
      geom_bar(stat = "identity", width = 1) +
      coord_polar("y") +
      theme_void() +
      labs(title = "Avg Life Expectancy by Continent")
  })
  
  output$gdpAreaPlot <- renderPlot({
    gapminder %>%
      filter(continent %in% input$continent) %>%
      group_by(year, continent) %>%
      summarise(avg_gdp = mean(gdpPercap)) %>%
      ggplot(aes(x = year, y = avg_gdp, fill = continent)) +
      geom_area(alpha = 0.6) +
      labs(y = "Avg GDP", x = "Year") +
      theme_minimal()
  })
  
  output$lifeLinePlot <- renderPlot({
    gapminder %>%
      filter(continent %in% input$continent) %>%
      group_by(year, continent) %>%
      summarise(avg_life = mean(lifeExp)) %>%
      ggplot(aes(x = year, y = avg_life, color = continent)) +
      geom_line(size = 1.2) +
      labs(y = "Avg Life Expectancy", x = "Year") +
      theme_minimal()
  })
  
  output$dataTable <- renderDT({
    datatable(filteredData())
  })
}

shinyApp(ui, server)
