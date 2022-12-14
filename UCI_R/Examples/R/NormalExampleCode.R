job.satisfaction.data<- read.csv(file="C:/Users/local-admin.math-la5253lpB/Desktop/NormalExampleData.csv", header=TRUE, sep=",")

#plotting histogram with fitted normal density
library(rcompanion)
plotNormalHistogram(job.satisfaction.data$score)

#fitting general linear model
summary(fitted.model<- glm(score ~ gender + age + educ, 
data=job.satisfaction.data, family=gaussian(link=identity)))

#using fitted model for prediction
print(predict(fitted.model, data.frame(gender="F", age=40, educ="bachelor")))


