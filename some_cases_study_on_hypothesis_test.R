setwd("C:\\Users\\SAKET NANDAN\\Documents\\rajshekhar_class\\22_april")#here we will paste the path of folder where we have 
#put all the data set

##### Normality Test##################

library(readxl)#this library is used for reading the excel file
install.packages("openxlsx")
library(openxlsx)
install.packages("WriteXLS")
library(WriteXLS)

######## Promotion.xlsx data ###################
#a financial analyst at financial institute wants to evaluate a recent credit card promotion. after this promotion, 450
#card holders were randomly selected.Half recieved on add promoting a full waiver(regular cutomer) of interest rate on 
#purchase made over next three month, and half recieved a standard christmas advertisement. Did the ad promoting full
# interset rate waiver increase purchase?
getwd()
Promotion<-read_excel("Promotion.xlsx")# Promotion.xlsx
View(Promotion)
setwd("C:\\Users\\SAKET NANDAN\\Documents\\rajshekhar_class\\22_april")
attach(Promotion)
colnames(Promotion)<-c("Credit","Promotion.Type","InterestRateWaiver","StandardPromotion")
#renaming the column names
View(Promotion)
write.csv(Promotion,file = "promotion_data.csv")#this comand is used to write the promotion data in promotion_data.csv and 
#file will be stored at the  folder path set by setwd() command
colnames(Promotion)
# Changing column names
attach(Promotion)

#############Normality test###############

shapiro.test(InterestRateWaiver) # Normality test
# p-value = 0.2246 >0.05 so p high null fly => It follows normal distribution

shapiro.test(StandardPromotion)
# p-value = 0.1916 >0.05 so p high null fly => It follows normal distribution

#############Variance test###############

var.test(InterestRateWaiver,StandardPromotion)#variance test
# p-value = 0.653 > 0.05 so p high null fly => Equal variances

############2 sample T Test ##################

t.test(InterestRateWaiver,StandardPromotion,alternative = "two.sided",conf.level = 0.95,correct = TRUE)#two sample T.Test
# alternative = "two.sided" means we are checking for equal and unequal
# means
# null Hypothesis -> Equal means
# Alternate Hypothesis -> Unequal Hypothesis
# p-value = 0.02523 < 0.05 accept alternate Hypothesis 
# unequal means

?t.test#by this command we can read the information or document t.test
t.test(InterestRateWaiver,StandardPromotion,alternative = "greater",var.equal = T)

# alternative = "greater means true difference is greater than 0
# Null Hypothesis -> (InterestRateWaiver-StandardPromotion) < 0
# Alternative Hypothesis -> (  InterestRateWaiver-standardpromotion) > 0  #(why we defined like that ? becoz in question they were asking 
#"did the ad promoting full interset rate waiver increse purchase?")
# p-value = 0.01211 < 0.05 => p low null go => accept alternate hypothesis
# InterestRateWaiver better promotion than StandardPromotion


###################Proportional Test(JohnyTalkers data)##########
#BUSINESS STMT. :-johnytalkers soft drinks division sales manager has been planning to launch a new sales oncentive program 
#for their sales executives. the sales executive felt that adults(>40years) wont buy,children will and hence requested sales
#manager not to launch the program analyze the data and determine whether there is evidence at 5% significance level to support
#the hypothesis

Johnytalkers<-read_excel("JohnyTalkers.xlsx")   # JohnyTalkers.xlsx
Johnytalkers<-read_excel(file.choose())
View(Johnytalkers) 
attach(Johnytalkers)
table(Icecream)#it is used to convert in he count table 
table(Person)
table1 <- table(Icecream,Person)
table1
?prop.test
prop.test(x=c(58,152),n=c(480,740),conf.level = 0.95,correct = FALSE,alternative = "two.sided")
# two. sided -> means checking for equal proportions of Adults and children under purchased
# p-value = 6.261e-05 < 0.05 accept alternate hypothesis i.e.
# Unequal proportions 

prop.test(x=c(58,152),n=c(480,740),conf.level = 0.95,correct = FALSE,alternative = "greater")
# Ha -> Proportions of Adults > Proportions of Children
# Ho -> Proportions of Children > Proportions of Adults
# p-value = 0.999 >0.05 accept null hypothesis 
# so proportion of Children > proportion of adult so sales executive do not launch the product(this sales executive want to 
#proove so this statement we have defined for null hypothesis)
# Do not launch the ice cream shop


#########Chi Square(Bahaman Research)#################
#bahamantech research company uses 4 regional centers in south asia(india,china,srilanka &bangladesh)to input data of 
#questionaire reponces.They audit a certain % of the questionaire responces versus data entry.any error in data entry renders
#it defective.the chief data scientist wants to check whether the defective% varies by country.analyze the data at 5% 
#significance level and help the manager draw appropriate inferrences.['1' means not defective and '0' means defective]

Bahaman<-read_excel("Bahaman.xlsx") # Bahaman.xlsx
View(Bahaman)
attach(Bahaman)
table(Country,Defective)
chisq.test(table(Country,Defective))
# p-value = 0.6315 > 0.05  => Accept null hypothesis
# => All countries have equal proportions 

#############Anova (Contract_Renewal Data )##########
#BUSSINESS STMT.:-a marketing organization outsources their back office operation to three diffrent suppliers.the contract are
#up for renewal and the CMO wants to determine whether they should renew contracts of suppliesrs with the latest 
#transaction time.CMO will renew all contracts if the performence of all suppliers is similar

CRD<-read_excel("ContractRenewal_Data.xlsx")   # ContractRenewal_Data(unstacked).xlsx
View(CRD)
Stacked_Data <- stack(CRD)#since we can not apply var.test on more than two columns for checking equal varience
View(Stacked_Data)
attach(Stacked_Data)
#var.test(ind,values)#its not working here so leveneTest is also used for varience test
library(car)
leveneTest(values,ind,data=Stacked_Data)
Anova_results <- aov(values~ind,data = Stacked_Data)
summary(Anova_results)
# p-value = 0.104 > 0.05 accept null hypothesis 
# All Proportions all equal 
##################################################chai square test#########################################################
#

# Customer order form 
# Unstacked data 

cof<-read_excel(file.choose()) # customer_order(unstacked).xlsx
View(cof) # countries are in their own columns; so we need to stack the data 
stacked_cof<-stack(cof)
attach(stacked_cof)
View(stacked_cof)
table(stacked_cof$ind,stacked_cof$values)
chisq.test(table(stacked_cof$ind,stacked_cof$values))

