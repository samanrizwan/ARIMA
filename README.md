# Germany Energy Time Series Analysis (Using R)

## Overview

This project performs **time series analysis and forecasting** on Germany’s daily electricity consumption dataset. The analysis focuses on understanding trends, seasonality, and the impact of renewable energy sources (wind and solar) on overall consumption.


## Dataset

This project uses the Germany daily energy dataset, accessed via GitHub:

 https://github.com/ajaykuma/Datasets_For_Work/blob/main/opsd_germany_daily.txt

Note: This dataset is commonly derived from the Open Power System Data (OPSD) platform, which provides open-access energy data for research and analysis.

The dataset contains daily observations with the following variables:

* **Date** – observation date
* **Consumption** – total electricity consumption
* **Wind** – wind energy production
* **Solar** – solar energy production
* **Wind.Solar** – combined renewable energy production

---

## Workflow

### 1. Data Preprocessing

* Date formatting and sorting
* Handling missing values
* Conversion of data types
* Feature engineering (e.g., renewable share, time-based features)

### 2. Exploratory Data Analysis (EDA)

* Visualization of consumption trends
* Analysis of renewable energy production
* Identification of seasonality and patterns

### 3. Time Series Preparation

* Conversion to time series objects
* Stationarity testing using Augmented Dickey-Fuller (ADF) test
* Time series decomposition (trend, seasonal, residual components)

### 4. Forecasting Models

1. ARIMA Model
Automatically selected optimal parameters using auto.arima()
Generated forecasts for the next 30 days

2. ARIMAX Model (with external variables)
Included Wind and Solar as exogenous variables
Improved model realism by incorporating renewable energy influence

### 5. Model Evaluation

* Evaluated residuals using checkresiduals()
* Ensured model assumptions are satisfied

---

##  Key Insights

* Electricity consumption shows clear seasonal patterns
* Renewable energy sources significantly influence consumption dynamics
* Models with external variables (ARIMAX) provide more realistic forecasts

---

## Technologies Used

* **R / RStudio**
* tidyverse
* lubridate
* forecast
* tseries
* ggplot2

---

## Use Cases

* Energy demand forecasting
* Renewable energy impact analysis
* Time series modeling practice
* Portfolio project for data science roles

---

## Future Improvements

* Integration of weather data
* Machine learning models (XGBoost, LSTM)
* Real-time forecasting pipeline
* Dashboard visualization

---
