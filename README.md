# Life-Expectancy-Shiny
An interactive dashboard built with R Shiny and shinydashboard to explore GDP and Life Expectancy trends across countries using the Gapminder dataset. Features include dynamic filtering by year and continent, real-time visualizations, summary statistics, and a searchable data table. Deployed on shinyapps.io.

# 🌍 Shiny Gapminder Dashboard

An interactive and visually rich dashboard built using **R**, **Shiny**, and **shinydashboard** to explore global development indicators like **GDP per capita** and **Life Expectancy** across different countries and continents over time.

Live App 👉 [https://mv1nayak.shinyapps.io/shiny-gapminder-app/](https://mv1nayak.shinyapps.io/shiny-gapminder-app/)

---

## 📘 About This App

This app allows users to:

- Explore development trends using the **Gapminder dataset**
- Compare GDP and Life Expectancy across continents and time
- View interactive visualizations and data tables
- Gain quick insights using year-based filtering and summary stats

The app is designed with a **clean, modern dashboard layout** for intuitive navigation and usability.

---

## ⚙️ How to Use

1. **Select a Year**  
   Use the **slider** on the sidebar to pick a year between 1952 and 2007.

2. **Filter by Continent**  
   Choose one or more continents from the **multi-select dropdown** to focus your analysis.

3. **Explore the Tabs**:
   - **Scatter Plot** – GDP vs Life Expectancy (log scale GDP)
   - **Summary Stats** – Number of countries, average GDP, average Life Expectancy
   - **Data Table** – View and sort the filtered dataset

---

## 🧩 Application Areas

This dashboard can be adapted or extended for:

- 🌎 **Global Development Monitoring**  
  Organizations like UNDP or WHO can analyze economic and health trends.

- 📊 **Data Journalism & Storytelling**  
  Journalists can use it to visualize international development stories.

- 🎓 **Education & Teaching**  
  A teaching tool for statistics, economics, public health, and data visualization.

- 🧪 **Prototype for Interactive Data Portals**  
  This framework can serve as a template for any public-facing analytics app.

---

## 🚀 Future Scope

Here are several features that could be added to enhance this app:

- 📁 **User Data Upload**: Allow users to upload their own CSV data
- 🌐 **Country-Level Comparison**: Side-by-side comparison of selected countries
- 📈 **Trend Lines**: Animate trends over years with `plotly` or `gganimate`
- 📊 **Multiple Metrics**: Add more variables like population, income groups
- 🔐 **Authentication**: Add user login/logout features using `shinymanager`
- 💾 **Download Options**: Enable exporting plots/data as CSV or PDF

---

## 💻 Local Setup Instructions

To run this app locally:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/<your-username>/shiny-gapminder-app.git
   cd shiny-gapminder-app
