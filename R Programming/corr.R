corr <- function(directory, threshold = 0) {
  id <- 1:332
  corVec <- NULL
  for(i in id){
    fileName <- sprintf('%03d',i)
    num <- complete(directory, id = i)[,2]
    if(num > threshold){
      filePath <- paste("~/",directory,"/",fileName,".csv", sep="")
      fileData <- read.csv(filePath)
      fileData <- fileData[(!is.na(fileData$nitrate)&!is.na(fileData$sulfate)),]
      corNum <- cor(fileData$sulfate,fileData$nitrate)
      corVec <- cbind(corVec,corNum)
    }
  }
  corVec <- as.vector(corVec)
  return(corVec)
}