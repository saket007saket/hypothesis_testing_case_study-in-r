#Fantaloons sales manager commented that % of males versus females walking into the store differ based
#on day of the week. analyze the data and determine wether there is evidence at 5% significance level
#to support this hypothesis

#data:-fantaloons.csv

#Research question:-does % of male female visit in store differ based on the day of week

#H0:male female % visit in store is same based on week days
#Ha:male female % visit in store is diffrent based on week days

library(stats)
visit<-read.csv(file.choose())
attach(visit)
View(visit)
c1<-as.numeric(visit$Weekdays)
c2<-as.numeric(visit$Weekend)
visit1<-data.frame(c1,c2)
visit2<-stack(visit1)
View(visit2)
visit3<-table(visit2)
View(visit3)
chisq.test(visit3)

#p-value = 8.543e-05 <0.05 its very less will reject null hypothesis
#we can conclude that male female % visit in store is diffrent based on week days

