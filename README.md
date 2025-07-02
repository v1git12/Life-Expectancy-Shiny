# Life-Expectancy-Shiny
An interactive dashboard built with R Shiny and shinydashboard to explore GDP and Life Expectancy trends across countries using the Gapminder dataset. Features include dynamic filtering by year and continent, real-time visualizations, summary statistics, and a searchable data table. Deployed on shinyapps.io.

# 🌍 Shiny Gapminder Dashboard

An advanced interactive dashboard built using **R**, **Shiny**, and **shinydashboard**, designed to analyze and visualize global development indicators like **GDP per Capita** and **Life Expectancy** across continents over time using the `gapminder` dataset.

🟢 **Live App**: [https://mv1nayak.shinyapps.io/shiny-gapminder-app/](https://mv1nayak.shinyapps.io/shiny-gapminder-app/)

---

## 📘 About the App

This upgraded version of the Gapminder Explorer includes:

- ✅ **KPIs / Metrics**  
  - Total Countries  
  - Highest Life Expectancy  
  - Highest GDP per Capita  
- 📊 **Interactive Charts**
  - Bar Plot: Average GDP by continent
  - Pie Chart: Life Expectancy distribution
  - Area Plot: GDP trends over years
  - Line Plot: Life Expectancy trends
- 🔎 **Filters / Slicers**
  - Year (slider input)
  - Continent (multi-select)
- 🧭 **Navigation Tabs**
  - Overview Dashboard
  - GDP Trends
  - Life Expectancy Trends
  - Raw Data Table

Designed with a clean dashboard layout using `shinydashboard`, making insights easy to access.

---

## 🧠 Usage / Application

This app can be used for:

| Use Case              | Description |
|-----------------------|-------------|
| 🌐 Global Development | Track GDP & health trends over time |
| 📊 Data Journalism    | Visual storytelling with clean charts |
| 🎓 Education          | Teach stats, data viz, or public health |
| 📈 Exploratory Analysis | Rapid insights without coding |

---

## 🚀 Future Scope

We plan to add:

- 📁 CSV Upload to explore user datasets
- 🌍 Country-to-Country comparisons
- 📤 Downloadable reports (PDF/CSV)
- 🎨 Light/Dark theme switcher using `bslib`
- 🧠 ML integration for predictions or clustering
- 🔐 User login/auth (e.g., via `shinymanager`)

---

## 💻 Run the App Locally

### ✅ Requirements:
- R ≥ 4.2
- RStudio

### 📦 Install dependencies:
```r
install.packages(c(\"shiny\", \"shinydashboard\", \"gapminder\", \"ggplot2\", \"dplyr\", \"DT\"))
