#''' Adding columns to dataframes
#' 
#' Two ways to do it:
#' 1) Base-R
#' 2) dplyr package
# '''

#Load  packages

library(dplyr)
library(caret)
library(tidyverse)

#''' =========================================================
#'Dataset is from the midwest dataset from the ggplot2 package
#'=============================================================

# to load the data into the workspace
data("midwest")  

#'''=====================================================
#' RENAMING A DATASET
#'   - since only exploring a small part of this dataset
#'=======================================================   
midwestCollegeEdu <- midwest



# inspect the data
head(midwestCollegeEdu) # will show first few rows and all the variable names (baseR)
midwestCollegeEdu %>% glimpse() # from tibble package - part of tidyverse package

#'''================================================================
#'Adding a new variable with mutate()
#'   - allows for calculation of new values to the variables created
#'==================================================================== 

midwestCollegeEdu <- mutate(midwestCollegeEdu, numCollegeEdu = (round(poptotal * percollege))) # rounded 

# created an additional column erroneously and so deleted it
midwestCollegeEdu <- mutate(midwestCollegeEdu, numCollegeEdu = NULL) 

# FOR LARGE DATASETS, TO PREVENT OUT OF MEMORY ERRORS use
library(data.table)
midwestCollegeEdu <- data.table(midwestCollegeEdu) #have to create it as a data.table though
midwestCollegeEdu[, numCollegeEdu:=NULL] #":= is an assignment by reference, and can be used with other assignment operators"




