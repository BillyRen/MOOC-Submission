pollutantmean <- function(directory, pollutant, id = 1:332) {
  fileLists <- sprintf('%03d',id)
  total <- 0
  num <- 0
  for(fileName in fileLists){
    filePath <- paste("~/",directory,"/",fileName,".csv", sep="")
    fileData <- read.csv(filePath)
    total <- total + sum(fileData[,which(colnames(fileData)==pollutant)],na.rm=TRUE)
    num <- num + sum(!is.na(fileData[,which(colnames(fileData)==pollutant)]))
  }
  mean <- total/num
  return(mean)
}