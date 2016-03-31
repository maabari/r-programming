## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all variables)
## required to compute the correlation between nitrate and sulfate;
## the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!

setwd() <- "C:/Users/nskovbjerg/Desktop/Coursera/rprog-data-specdata/specdata" ## NoTE: INSERT THE WORKING DIRECTORY PATH HERE

## START FUNCTION ##
directory <- getwd() ##ASSIGN WORWING DIRECTORY PATH TO DIRECTORY
corr <- function(directory, threshold = 0) {
        filelist <- list.files(directory, full.names = TRUE)
        nvector <- vector(mode = "numeric", length = 0)
        
        for (i in 1:length(filelist)) {
                file_i <- read.csv(filelist[i])
                completecases <- sum((!is.na(file_i$sulfate)) & (!is.na(file_i$nitrate)))
                if (completecases > threshold) {                
                filter_sulfate <- file_i[which(!is.na(file_i$sulfate)), ]
                filter_sum <- filter_sulfate[which(!is.na(filter_sulfate$nitrate)), ]
                nvector <- c(nvector, cor(filter_sum$sulfate, filter_sum$nitrate))
                }
        }
        nvector
}
## END FUNCTION ##


## ************************** C H E C K ************************** ##

corr(getwd(), 150) ##CHECK: OK!
##  [1] -0.018957541 -0.140512544 -0.043897372 -0.068159562 -0.123506666 ... -0.044898818

summary(corr(getwd(), 150)) ##CHECK: OK!
##    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21060 -0.04999  0.09463  0.12530  0.26840  0.76310

corr(getwd(), 400) ##CHECK: OK!
##  [1] -0.018957541 -0.043897372 -0.068159562 -0.075888144  0.763128837 ... 0.006863930
summary(corr(getwd(), 5000)) ##CHECK: OK!

##Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##

length(corr(getwd(), 5000)) ##CHECK: OK!
## [1] 0
