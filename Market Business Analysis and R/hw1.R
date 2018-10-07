#Author - Vaibhav Soni
#UTA-ID = 1001558809

#LOAD PACKAGES
install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)
install.packages("tidyverse")
library(tidyverse)
install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)

install.packages(apriori)
#course_enrollment<-read.csv('C:/Users/utava/OneDrive - University of Texas at Arlington/Data Science Nerur/Market Business Analysis and R/student-courses.csv')
#glimpse(course_enrollment)


#1.LOAD THE DATA
trans = read.transactions("C:/Users/utava/OneDrive - University of Texas at Arlington/Data Science Nerur/Market Business Analysis and R/student-courses.csv", format = "single", sep = ",", cols = c("student_id","course"))

summary(trans)
#2.Perform an affinity analysis using support of 0.02 and confidence of 0.3
association.rules<-apriori(trans,parameter = list(supp=0.02,conf=0.3))
#3.How many rules did the system generate? 40 RULES GENERATED
summary(association.rules)

#4.Sort the display by descending order of lift and display the top 5 rules.
top.lift <- sort(association.rules, decreasing = TRUE, na.last = NA, by = "lift")

list_rules = inspect(association.rules[1:5])

subject.association.rules<-apriori(trans,parameter = list(supp=0.02,conf=0.3),appearance = list(lhs="AC104",default="rhs"))
#5.If a student has taken AC104, which course (just one) would you recommend to this student? If you had to recommend two, which two would they be?
inspect(head(subject.association.rules))#this will give you the subjects recommended along with AC104 i.e MG501 and QA812
print("finish")

