setwd("C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming")

#º¯Êý
pollutantmean <- function(directory, pollutant, id = 1:332) {
  id <- as.character(id)
  filepath <- paste("C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming/data/specdata/",id,".csv", sep="")
  pol.data <- read.csv(filepath)
  
  output <- mean(pol.data[,which(colnames(pol.data)==pollutant)],na.rm=TRUE)
  return(output)
}

#²âÊÔº¯Êý
pol.data <- read.csv("C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming/data/specdata/001.csv")

pollutant <- "sulfate"
mean(pol.data[,which(colnames(pol.data)==pollutant)],na.rm=TRUE)

id <- "001"
filepath <-paste("C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming/data/specdata/",id,".csv", sep="")
