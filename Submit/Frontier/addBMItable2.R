
library(epiDisplay)
library(plyr)
library(dplyr)
library(tidyverse)


# Read the data into memory -----------------------------------------------

library(haven)



y14bmi <- read_csv("dat/y14bmi.csv", col_types = cols(wstval = col_number(), 
                                                      bmival = col_number()))
y56bmi <- read_csv("dat/y56bmi.csv", col_types = cols(wstval = col_number(), 
                                                      bmival = col_number()))
y78bmi <- read_csv("dat/y78bmi.csv", col_types = cols(wstval = col_number(), 
                                                      bmival = col_number()))
y9bmi <- read_csv("dat/y9bmi.csv", col_types = cols(wstval = col_number(), 
                                                      bmival = col_number()))

NDNS_bmi <- rbind(y14bmi, y56bmi, y78bmi, y9bmi)
