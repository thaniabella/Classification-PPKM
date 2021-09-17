library(e1071)
library(caret)
library(devtools)

PPKM = read.csv(file.choose(),header = TRUE, sep = ";")
View(PPKM)

#Training sample with n observation
# 75% data untuk data training, sisanya data testing
n=round(nrow(PPKM)*0.8)
n
set.seed(12345)
sample=sample(seq_len(nrow(PPKM)), size = n)
train=PPKM[sample, ]
test=PPKM[-sample, ]

## Support Vector machine
PPKM=as.factor(PPKM$Klasifikasi)
data.svm<-svm(factor(Klasifikasi) ~., data = train)
data.svm

#Pengujian Model SVM data training
prediks1 <- predict(data.svm, train)
prediks1
table(prediks1)
confusionMatrix(prediks1, factor(train$Klasifikasi))
