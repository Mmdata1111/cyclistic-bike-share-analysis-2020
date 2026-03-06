# Cyclistic Bike Share Data Analysis (2020)

Author: Maia Perun  

This project analyzes Cyclistic’s 2020 bike-share data to identify behavioral differences between casual riders and annual members and evaluate opportunities for membership conversion.

---

# Business Task

Cyclistic's marketing team wants to convert casual riders into annual members.  
This analysis explores behavioral differences between rider types to identify potential strategies for membership conversion.

---

# Dataset

The dataset contains 12 months of Cyclistic bike share trips from 2020.

Total records analyzed:  
3,476,988 rides

### Original Data Fields
- ride_id
- start_station_name
- end_station_name
- started_at
- ended_at
- member_casual

### Derived Fields Created During Analysis
- ride_length_minutes
- day_of_week
- start_ride_hour
- time_of_day
---

# Tools Used

- Excel
- Google BigQuery (SQL)
- Tableau

---

# Analysis Workflow

1. Data cleaning and validation
2. Feature engineering
3. Data integration in BigQuery
4. Exploratory data analysis
5. Visualization in Tableau
6. Business insight generation

---

# Key Insights

• Members account for approximately 61% of total rides.  

• Casual riders take significantly longer rides on average than members.  

• Members show strong weekday commuting patterns.  

• Casual riders show stronger weekend and summer usage.  

• Casual riders cluster around recreational and tourist stations.

---

# Tableau Dashboard

Interactive dashboard available here:

https://public.tableau.com/app/profile/maia.perun/viz/CyclisticBikeShareAnalysisMaiaPerun/ExploratoryRideAnalysis2020

---

# Project Files

Cyclistic_Bike_Share_2020_Report.pdf – Full analysis report  

sql/cyclistic_analysis_queries.sql – SQL queries used for analysis  

tableau/tableau_dashboard_link.txt – Tableau dashboard link  

documentation/data_validation.md – Data cleaning and validation notes  

documentation/data_dictionary.md – Dataset column definitions

---

# Data Source

Dataset: Divvy Bike Share Data (Cyclistic case study)
Source: Motivate International Inc.
This dataset is made available for analysis under public data usage guidelines.
