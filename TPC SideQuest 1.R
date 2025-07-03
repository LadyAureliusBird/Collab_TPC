#https://opportunityinsights.org/course/ 
#Assignment 1 
#clear the workspace
rm(list=ls())
#Install and load haven, Hmisc, sandwich and lmtest packages
install.packages("haven")
#install.packages("SDMTools")# - not compatible with current version of R
#library(SDMTools)
install.packages("Hmisc") #alternative to SDMTools 
install.packages("sandwich")
install.packages("lmtest")
library(sandwich)
library(lmtest)
library(haven)
library(Hmisc)

#Change working directory and load stata data set
#setwd("C:/Users/gbruich/Ec1152/Projects")
atlas <- read_dta("atlas.dta")
# Install and load package

#Report weighted summary statistics
meanCount = weighted.mean(atlas$yvar, atlas$count_pooled)
meanSD = sqrt(wtd.var(atlas$yvar,atlas$count_pooled))

#set state and county FIPS code https://transition.fcc.gov/oet/info/maps/census/fips/fips.txt 
query_state <- 55
query_county <- 079 
current_state <- subset(atlas,state == query_state)
current_county <- subset(atlas,state == query_state & county == query_county)





fileName <- cat(query_state,"log.txt")
sink(file=fileName, split=TRUE)
sink()