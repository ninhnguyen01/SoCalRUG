rate.data<- read.csv(file='C:/Users/local-admin.math-la5253lpB/Desktop/LogisticExerciseData.csv',
header=TRUE, sep=',')

#specifying reference category
default.rel<- relevel(rate.data$default, ref="No")

#fitting logistic model
summary(fitted.model.logit<- glm(default.rel~LTV+age+income, 
data=rate.data, family=binomial(link=logit)))

#using logistic model for prediction
print(predict(fitted.model.logit, type='response', 
data.frame(LTV=50, age=50, income='high')))
