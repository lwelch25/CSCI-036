
#Forecasting with XTS objects

library(quantmod)
library(tseries)
library(timeSeries)
library(forecast)
library(xts)

#Pull data from yahoo finance

getSymbols('TSLA', from='2019-01-01', to= '2022-10-29')
class(TSLA) #Class is XTS/zoo

#Want the close of each day, therefore it needs to be the 4th column.
#1) Open 2)High 3)Low 4)Close 5)volume 6) Adjusted

TSLA_Close_Prices = TSLA[,4]

#Plot the data - look at the last 12  years of TSLA close of day prices
#IPO on June 29th, 2010

plot(TSLA_Close_Prices)
class(TSLA_Close_Prices) #Class is xts/zoo

#Graph the ACF and PACF looking for identifable 
par(mfrow=c(1,1))
Acf(TSLA_Close_Prices, main='ACF for Differenced Series')
Pacf(TSLA_Close_Prices, main='PACF for Differenced Series')

#Test findings on original1XTS objects 
#ADF test for p-value
print(adf.test(TSLA_Close_Prices)) #p value = 0.4509
auto.arima(TSLA_Close_Prices, seasonal=FALSE) #Arima 3,1,4 

#AIC = 6694.21 BIC = 6699.08
fitA= auto.arima(TSLA_Close_Prices, seasonal = FALSE) #autoarima = (0,1,0)
tsdisplay(residuals(fitA), lag.max = 40, main = '(0,1,0) Model Residuals')
auto.arima(TSLA_Close_Prices, seasonal=FALSE)

fitB = arima(TSLA_Close_Prices, order=c(1,2,4))
tsdisplay(residuals(fitB), lag.max=40, main='(1,2,4) Model Residuals')

fitC = arima(TSLA_Close_Prices, order=c(3,1,4))
tsdisplay(residuals(fitB), lag.max=40, main='(3,1,4) Model Residuals')

fitD = arima(TSLA_Close_Prices, order=c(1,1,1))
tsdisplay(residuals(fitB), lag.max=40, main='(1,1,1) Model Residuals') #autodefault in any business program

#plots of arima  model
par(mfrow=c(2,2))
#auto arima (2,0,2)
term<-200
fcast1<-forecast(fitA, h=term)
plot(fcast1)

#custom arima (3,0,3)

fcast2 <- forecast(fitB, h=term)
plot(fcast2)
fcast3 <- forecast(fitC, h=term)
plot(fcast3)
fcast4 <-forecast(fitD, h=term)
plot(fcast4)

#Mape accuracy siubtract from 100
accuracy(fcast1)
accuracy(fcast2)
accuracy(fcast3)
accuracy(fcast4)








