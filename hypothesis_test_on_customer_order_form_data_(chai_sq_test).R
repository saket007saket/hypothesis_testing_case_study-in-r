#Terecalls uses 4 centers around the globe to process customer order forms.They audit certain %
#of the customer order forms. Any error in order form renders is defective and has to be reworked
#before processing. the manager wants to check whether the defective % varies by centers.please 
#analyse the data at 5% significance level and help mager to draw appropriate inferences. 

#data is customer+orderform.csv

#research question:does  defective % is varying by centers?
 #H0: defective percentage for diffrent centers are same
#Ha: defective percentage for diffrent centers are diffrent

#since it has more than 2 proportion comparision so we will use chai square test
# import libraries into current session

library(stats)
 variation<-read.csv(file.choose())
 View(variation)
 attach(variation)
#-----------------------------------------------------------------------------------------------------
 #library(plyr)
 #Phillippines<-revalue(Phillippines,c("Error Free"=1,"Defective"=0))
 #Indonesia<-revalue(Indonesia,c("Error Free"=1,"Defective"=0))
 #India<-revalue(India,c("Error Free"=1,"Defective"=0))
 #Malta<-revalue(Malta,c("Error Free"=1,"Defective"=0))
 
# since chisq.test() donot take chracter value se we need to convert in numerical value for levels
#------------------------------------------------------------------------------------------------------
 #as.numeric()converts catorical data in numeric value according to levels
 Phillippines<-as.numeric(Phillippines)
Indonesia<-as.numeric(Indonesia)
India<-as.numeric(India)
Malta<-as.numeric(Malta) 
variation2<-data.frame(Phillippines,Indonesia,India,Malta)
#------------------------------------------------------------------------------------------------------
View(variation2)
#chisq.test(variation2)
#chisq.test() takes data  in count value form for each categorical data in this case varition2 table 
#do not contain data in count value form for each category it is giving
#" warning massage:In chisq.test(variation2) : Chi-squared approximation may be incorrect"
#-----------------------------------------------------------------------------------------------------
stack_info<-stack(variation2)
table(stack_info)
#now table comes under formate values~ind , on such formate we can apply chisq.test()
chisq.test(table(stack_info))

#p-value=0.2771>0.05 which say null hypothesis is accepted 
#which conclude that defective % in all centers are same
