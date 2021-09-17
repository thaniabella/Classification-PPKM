PPKM = read.csv(file.choose(),header = TRUE, sep = ";")
library(e1071)
library(caret)
sampel=sample(1:nrow(PPKM),0.8*nrow(PPKM),replace = TRUE)
training=data.frame(PPKM)[sampel,]
testing=data.frame(PPKM)[-sampel,]
testing
modelNB=naiveBayes(Klasifikasi~.,data = training)
modelNB
plot(modelNB)
prediksi=predict(modelNB,testing)
prediksi
hasil=confusionMatrix(table(prediksi,testing$Klasifikasi))
hasil