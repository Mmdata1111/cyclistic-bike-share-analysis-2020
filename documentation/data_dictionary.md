# Data Dictionary  
**Cyclistic Bike Share 2020 Dataset**  
Author: Maia Perun

## Overview
This data dictionary defines the variables used in the Cyclistic bike-share dataset. Understanding these fields ensures consistent interpretation of the dataset during analysis.

## Variables

| Column Name | Description |
|--------------|-------------|
| **ride_id** | Unique identifier assigned to each ride. Used to track individual trips. |
| **rideable_type** | Type of bike used for the ride (e.g., classic bike, electric bike, docked bike). |
| **started_at** | Timestamp indicating when the ride began. |
| **ended_at** | Timestamp indicating when the ride ended. |
| **start_station_name** | Name of the station where the ride started. |
| **start_station_id** | Unique identifier of the start station. |
| **end_station_name** | Name of the station where the ride ended. |
| **end_station_id** | Unique identifier of the end station. |
| **start_lat** | Latitude coordinate of the ride start location. |
| **start_lng** | Longitude coordinate of the ride start location. |
| **end_lat** | Latitude coordinate of the ride end location. |
| **end_lng** | Longitude coordinate of the ride end location. |
| **member_casual** | Indicates whether the rider is a **Cyclistic member** or a **casual user**. |

## Derived Fields Used in Analysis

| Column Name | Description |
|--------------|-------------|
| **ride_length_minutes** | Duration of the ride in minutes, calculated from `ended_at - started_at`. |
| **day_of_week** | Day of the week derived from the ride start time to identify usage trends by weekday. |
| **start_ride_hour** | Hour of the day when the ride started, used to analyze peak usage times. |
| **time_of_day** | Categorized time period of the ride start (e.g., morning, afternoon, evening, night) used to analyze usage patterns throughout the day. |