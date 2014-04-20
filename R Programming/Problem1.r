setwd("C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming")

#º¯Êý
pollutantmean <- function(directory, pollutant, id = 1:332) {
  file <- sprintf('%03d',id)
  filepath <- paste("C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming/data/specdata/",file,".csv", sep="")
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

#²¹È«id
for(i in a){
  if(i>=0&i<10){
    file <- paste("00",as.character(i),sep="")
    print(file)
  }
  else if(i>=10&i<100){
    file <- paste("0",as.character(i),sep="")
    print(file)
  }
  else{
    file <- as.character(i)
    print(file)
  }
}