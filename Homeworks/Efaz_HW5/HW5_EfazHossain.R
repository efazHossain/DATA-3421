## Week 6 Homework

#install.packages("tidyverse")
library(tidyverse)

#install.packages("dplyr")
library(dplyr)

#install.packages("tidyr")
library(tidyr)

#library(ggplot2) # data visualization
library(datasets)


#1 Importing Data into R
#make sure right working directory is set
#session > set working directory > choose directory 
getwd()
df<-read.csv("data.csv")

#2 Exploring Data
head(df)
nrow(df) # number of rows
ncol(df) # number of columns
names(df)

#3 Basic Operations with Data Frame
df['Age']

#4 Filtering a Data Frame
filtered_data <- subset(df, Age >= 25)
filtered_data

#5 Generate Statistical Indicators
mean(df$Income)

#6 Descriptive Statistics with the psych packages
#install.packages("psych")
library(psych)
#install.packages("Hmisc")
library(Hmisc)

describe(df$HoursWorkedPerWeek)
describe(df, na.rm=TRUE) #this command removes all missing values 

#7 Determining Skewness and Kurtosis
skewness(df$Weight_kg)
kurtosis(df$Weight_kg)

#8 Data Transformation
library(dplyr)
df$LogIncome <- log(df$Income)
head(df)

#9 Recoding Continuous Variables
df$JobSatisfaction[df$JobSatisfaction<=3]="Low"
df$JobSatisfaction[df$JobSatisfaction>=4 & df$JobSatisfaction<=7]="Medium"
df$JobSatisfaction[df$JobSatisfaction>=8]="High"
head(df)

#10 Sorting Data Frames
df<-df[order(df$Age),] # low to high
View(df)

#11 Using filter()
filtered_data2 <- df %>%
  filter(HoursWorkedPerWeek > 40, Country == "USA")
filtered_data2

#12 Using arrange()
df <- df %>%
  arrange(Income)
df

#13 Pick Variables by Their Names (select())
selected_columns <- df %>%
  select(ID, Age, Gender)
selected_columns

#14 Create New Variables with Existing Variables (mutate())
df <- df %>%
  mutate(BMI = Weight_kg / (Height_cm^2))
df

#15 Label Encoding
df <- df %>%
  mutate(gender_encoded = ifelse(Gender == "Female", 0, ifelse(Gender == "Male", 1, NA)))
df

