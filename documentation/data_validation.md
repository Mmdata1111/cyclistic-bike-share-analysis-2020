# Cyclistic Bike Share Data Analysis – Data Validation
Author: Maia Perun

## Overview

Several validation steps were performed to ensure data integrity and consistency before analysis.

## Ride Length Calculation and Validation

Ride duration was initially calculated in Excel using:

`ride_length = ended_at - started_at`

Because Excel stores time as fractions of a day, ride duration was standardized into numeric minutes using:

`ride_length_minutes = (ended_at - started_at) * 1440`

The following records were removed:

- rides shorter than 1 minute
- rides longer than 1440 minutes (24 hours)
- rides with zero or negative duration values

These records likely represent accidental unlocks, system test rides, canceled trips, or logging errors.

## Handling Missing Station Names

Some records contained blank values in `start_station_name` and `end_station_name`.

Instead of deleting these rows, missing values were replaced with:

`"Unknown"`

This preserved valid ride activity while maintaining dataset completeness for behavioral analysis.

## Handling Missing Coordinates

Some rides contained missing latitude and longitude values, particularly in `end_lat` and `end_lng`.

These fields were retained but excluded from geographic analysis because the project focused primarily on rider behavior patterns rather than route-level spatial analysis.

## Data Integration Validation

After cleaning, monthly datasets were exported as CSV files, uploaded to Google BigQuery, and combined using `UNION ALL`.

Validation checks included:

- confirming row counts after combining monthly datasets
- verifying structural consistency across tables
- confirming timestamp formats were consistent
- reviewing the distribution of `member` vs `casual` riders
- ensuring no data loss occurred during integration

## Final Dataset Size

Final analysis-ready dataset:

**3,476,988 rides**