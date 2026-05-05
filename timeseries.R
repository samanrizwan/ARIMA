install.packages(c("tidyverse", "lubridate", "forecast", "tseries", "ggplot2", "urca"))

library(tidyverse) #data manipulation
library(lubridate) #date handling
library(forecast) #ARIMA, ETS models
library(tseries) #stationarity tests 
library(ggplot2) #visualization like line plot
library(urca) #


data <- read.csv("path_to_data_file")

# Convert Date column
data$Date <- as.Date(data$Date, format = "%Y-%m-%d")

# Sort data (VERY important in time series)
data <- data %>% arrange(Date)

# Check structure
str(data)
summary(data)


# Handle missing values
data <- data %>% drop_na()
str(data)
view(data)
# Create new useful features
data <- data %>%
  mutate(
    RenewableShare = (`Wind.Solar`) / Consumption,
    Month = month(Date),
    Year = year(Date),
    Weekday = wday(Date, label = TRUE)
  )
#EDA
ggplot(data, aes(x = Date, y = Consumption)) +
  geom_line() +
  ggtitle("Electricity Consumption Over Time")

ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Wind, color = "Wind")) +
  geom_line(aes(y = Solar, color = "Solar")) +
  ggtitle("Renewable Energy Production")

#create time series object
ts_consumption <- ts(data$Consumption, frequency = 365)

#Stationarity Check
#p-value > 0.05 → NOT stationary → need differencing
#p-value < 0.05 → OK
adf.test(ts_consumption)
ts_consumption <- ts(data$Consumption, frequency = 7)

#Decomposition (Trend + Seasonality)
decomp <- stl(ts_consumption, s.window = "periodic")
plot(decomp)  #plot weekly seasonality


#TS model ARIMA
model_arima <- auto.arima(ts_consumption)
summary(model_arima)

#Predict next 30 days of electricity demand
forecast_values <- forecast(model_arima, h = 30)

plot(forecast_values)

#use external variables here wind and solar
#ARIMAX Makes model much more realistic
model_xreg <- auto.arima(
  ts_consumption,
  xreg = as.matrix(data[, c("Wind", "Solar")])
)

summary(model_xreg)

#model validation
checkresiduals(model_arima)
