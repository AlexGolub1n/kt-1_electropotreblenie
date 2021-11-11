# Установка пакетов
install.packages('ggplot2')
install.packages('tidyverse')

#подключение библиотек
library(ggplot2)
library(tidyverse)


#подключение данных
table1 <- read.csv("RU_Electricity_Market_PZ_dayahead_price_volume.csv", header = TRUE, sep = ",")
data1 <- read.csv("112.csv", header = TRUE, sep = ",")

# Посмотрим названия столбцов
names(data1)

#авторегрессия
set.seed(49)
y <- arima.sim(n = nrow(data1), data1)
plot(y)


#строим график
ggplot(data = data1)+
  geom_point(alpha = 1/2, mapping = aes(x= timestep, y = price_eur, color = consumption_eur))


ggplot(data = data1)+
  geom_point(alpha = 1/4, mapping = aes(x= consumption_eur, y = price_eur))

