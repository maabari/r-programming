#WEEK 2 programming quiz 2#
## 'directory' is a character vector of length 1 indicating the location 
## of the CSV files
## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the mean; either "sulfate" 
## or "nitrate".'id' is an integer vector indicating the monitor ID numbers to be
## used.

## Return the mean of the pollutant across all monitors list in the 'id'
## vector (ignoring NA values)
## NOTE: Do not round the result!

directory <- getwd()
pollutantmean <- function(directory, pollutant, id = 1:322) {
        filelist <- list.files(directory, full.names = TRUE)
        combineddata <- data.frame()
        for(i in id) {
                combineddata <- rbind(combineddata, read.csv(filelist[i]))     
        }
        x <- mean(combineddata[, pollutant], na.rm = TRUE)
        return(x)
}

x <- pollutantmean(directory, "nitrate", id = 1:322)
y <- pollutantmean(directory, "sulfate", id = 1:322)
x_50 <- pollutantmean(directory, "nitrate", id = 1:50)
y_50 <- pollutantmean(directory, "sulfate", id = 1:50)
x_10 <- pollutantmean(directory, "nitrate", id = 1:10)
y_10 <- pollutantmean(directory, "sulfate", id = 1:10)
x_70_72 <- pollutantmean(directory, "nitrate", id = 70:72)
x_23 <- pollutantmean(directory, "nitrate", id = 23)

## x [1] 1.682678, y [1] 3.209488 CHECK: OK! ##
