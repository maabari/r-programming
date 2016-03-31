setwd() <- "C:/Users/nskovbjerg/Desktop/Coursera/rprog-data-specdata/specdata" ## NoTE: INSERT THE WORKING DIRECTORY PATH HERE

## START FUNCTION ##

directory <- getwd() ##ASSIGN WORWING DIRECTORY PATH TO DIRECTORY
complete <- function(directory, id = 1:332) {
        filelist <- list.files(directory, full.names = TRUE)
        dataframe <- data.frame()
        
        for (i in id) {
                file_i <- read.csv(filelist[i])
                nobs <- sum(complete.cases(file_i))
                dataframe_i <- data.frame(i, nobs)
                dataframe <- rbind(dataframe, dataframe_i)
        }
        colnames(dataframe) <- c("id", "nobs")
        dataframe
}

## END FUNCTION ##


## ************************** C H E C K ************************** ##

complete(getwd(), 1)                    #result 117. CHECK: OK!
complete(getwd(), c(2, 4, 8, 10, 12))   #CHECK: OK!
complete(getwd(), 30:25)                #CHECK: OK!
complete(getwd(), 3)                    #CHECK: OK!
