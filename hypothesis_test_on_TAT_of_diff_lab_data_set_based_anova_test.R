#A hospital wants to determine whether there is any difference in the average turn around time (TAT) 
#of reports of the laboratories on their preffered list. they collected a random sample and recorded 
#TAT for reports of 4 laboratories . TAT is defined as sample collected to report dispatch.

#analyze the data and detrmine whether there is any diffrence in average TAT among the different
#laboratories at 5% significance level.

#reserch question:- is there any diffrence in average TAT among diffrent laboratory

#since here we are  here comparing four diffrent data sets.

library(nortest)
library(car)

LABs_data<-read.csv(file.choose())
View(LABs_data)

#we are combinig all the columns in one column so that we do not need to test normality for each column
#one by one

stacked_data<-stack(LABs_data)
View(stacked_data)
attach(stacked_data)
 #now we will check normality of of each data set by ad.test

ad.test(values)

#since p-value is 0.0507 which is good enough to accept null hypothesis 
#therefore we can conclude that data is normally distributed


#now we will check the data set have equal varience or not using levene test

leveneTest(values~ind,data=stacked_data)
#p-value=0.051 indicates that null hypothesis is accepted i.e data sets have equal variences

#research question:-is there any diffrence in average TAT among diffrent laboratory
#H0:-average TAT of all laboratory are  same
#Ha:-avearage TAT of all laboratory are not same

Annova_result<-aov(values~ind,data = stacked_data)
summary(Annova_result)

#here p-value of anova test is very less i.e 2e-16<0.05 null hypothesis rejected
#so we can conclude that 

#conclude that avg TAT of all lab is  not same