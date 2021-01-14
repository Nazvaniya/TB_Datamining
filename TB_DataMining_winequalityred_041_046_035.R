#pengaturan lokasi kerja
lokasi_kerja <- "D:/wd"
setwd(lokasi_kerja)
getwd()
#membaca dataset
dataset <- read.csv("winequalityred.csv",sep = ";")
#menggunakan library
library(caret)
library(tidyverse)
library(rpart)
library(rpart.plot)
#menampilkan struktur dari sebuah objek
str(dataset)
#menampilkan 10 sampel
sample_n(dataset, 10)
#membagi datanya menjadi training dan testing
set.seed(123)
training.samples <- dataset$quality %>% createDataPartition(p = 0.8, list = FALSE)
train.data <- dataset[training.samples, ]
test.data <- dataset[-training.samples, ]
#membuat model
model <- rpart(quality ~., data = train.data, method = "class")
#menampilkan pohon model
rpart.plot(model, yesno = 2, extra = 100)
#melakukan prediksi pada data testing
predicted.classes <- model %>% predict(test.data, type = "class")
#menampilkan beberapa nilai dari objek yang diprediksi
head(predicted.classes)
#menampilkan beberapa nilai dari objek yang sebenarnya
head(test.data$quality)
#menghitung rata rata dari perbandingan nilai prediksi dan nilai sebenarnya
mean(predicted.classes == test.data$quality)