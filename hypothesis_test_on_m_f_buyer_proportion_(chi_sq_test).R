#sales of products n four diffrent region is tabulated for males and females.find if male-female
#buyer rations are similar across regions

#                  east     west     north   south
 #  males          50       142      131     7
#  female          550      351      480     350



#research question: does male female buyer ratios are similar across region

#H0: male female buyer proportion are same acroos the region
#Ha: male female buyer proportion are diffrent acroos the region
 #since it has more than 2 proportion comparision so we will use chai square test
# import libraries into current session

library(stats)

buyer_ratio<-read.csv(file.choose())
View(buyer_ratio)
attach(buyer_ratio)
#------------------------------------------------------------------------------------------------------
#stack_info<-stack(buyer_ratio)
#Veiw(stack_info)

#View(table(stack_info))
#it will convert stacked data into table formate on which we can apply chi square test

#chisq.test(table(stack_info))
#if i apply above code it will change the count value which may give slight change  in p-value=0.2931 
#with error massage"Warning message:In chisq.test(table(stack_info)) :Chi-squared approximation may be
#incorrect"
#------------------------------------------------------------------------------------------------------
#so chisq.test() do not take character value of table it takes only numerical value so we need to
#remove column conataining male female
c1<-buyer_ratio$East
c2<-buyer_ratio$West
c3<-buyer_ratio$North
c4<-buyer_ratio$South
t<-data.frame(c1,c2,c3,c4)
View(t)
chisq.test(t)
#pvalue is 0.6603>0.05 which accept null hypothesis 
#we can conclude that male female buyer proportion are similar  acroos the region
