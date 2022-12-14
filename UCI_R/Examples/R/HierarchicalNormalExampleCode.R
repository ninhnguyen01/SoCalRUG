dyads.data<- read.csv(file="C:/Users/local-admin.math-la5253lpB/Desktop/HierarchicalNormalExampleData.csv", 
header=TRUE, sep=",")

#creating long-form data set
library(reshape2)

data.depr<- melt(dyads.data[,c("family", "individual", "relation", "depression1","depression2",
"depression3")], id.vars=c("family","individual", "relation"), variable.name="depr.visits",
value.name="depression")
data.qol<- melt(dyads.data[,c("qol1","qol2", "qol3")], variable.name="qol.visits", value.name="qol")
longform.data<- cbind(data.depr, data.qol)

#creating numeric variable for time
visit<- ifelse(longform.data$depr.visits=="depression1", 1, ifelse(longform.data$depr.visits
=="depression2", 2, 3)) 

#plotting histogram with fitted normal density
library(rcompanion)

plotNormalHistogram(longform.data$qol)

#fitting hierarchical model
library(lme4)

summary(fitted.model<- lmer(qol ~ relation + depression + visit 
+ (1 + visit|family) + (1 + visit|family:individual), 
control=lmerControl(calc.derivs = FALSE), data=longform.data))

#using fitted model for prediction
print(predict(fitted.model, data.frame(family=25, individual=1, 
relation="M", depression=0, visit=3), allow.new.levels=TRUE))

