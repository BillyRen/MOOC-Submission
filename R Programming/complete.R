complete <- function(directory, id = 1:332) {
  fileLists <- sprintf('%03d',id)
  output <- data.frame(id=0,nobs=0)
  output<-output[0,]
  for(i in id){
    fileName <- sprintf('%03d',i)
    filePath <- paste("~/",directory,"/",fileName,".csv", sep="")
    fileData <- read.csv(filePath)
    nob <- sum(!is.na(fileData$nitrate) & !is.na(fileData$sulfate))
    temp <- data.frame(id=i, nobs=nob)
    output<-rbind(output,temp)
  }
  return(output)
}

