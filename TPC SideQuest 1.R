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
#there is a problem with mean count, I copied this from the PDF 
#this is the current error "'x' and 'w' must have the same length" 
#prev code used SDM Tools, new code uses the in-built method from R, need to check the paramaters in the new in-built method 
meanCount = weighted.mean(atlas$yvar, atlas$count_pooled)
meanSD = sqrt(wtd.var(atlas$yvar,atlas$count_pooled))

#set state and county FIPS code https://transition.fcc.gov/oet/info/maps/census/fips/fips.txt 
#manually confirm validation of state/county/tract 
query_state <- 55
query_county <- 079 
query_tract <- 20100
current_state <- subset(atlas,state == query_state)
current_county <- subset(atlas,state == query_state & county == query_county)
current_tract <- subset(atlas,state == query_state & county == query_county & tract == query_tract)

p_pooled_var <- current_tract$kfr_pooled_p25



fileName <- cat(query_state,"log.txt")
sink(file=fileName, split=TRUE)
sink()
