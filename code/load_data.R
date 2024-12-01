#loads necessary libraries
library(dplyr)
library(ggplot2)

#loads the dataset
load('data/original/elections_polls.RData')

#examines structure of the dataset
str(polls)