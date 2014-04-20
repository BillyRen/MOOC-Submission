setwd("C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming")

#º¯Êý
path<-"C:/Users/Billy/SkyDrive/Documents/GitHub/MOOC-Submission/R Programming/data/"
pollutantmean <- function(directory, pollutant, id = 1:332) {
  total<-read.csv(paste(path,directory,"/001.csv",sep=""))[0,]
  for (i in id)
{file<- sprintf('%03d',i)
 filepath<- paste(path,directory,"/",file,".csv", sep="")
 pol.data<- read.csv(filepath)
 total<-rbind(total,pol.data )
 output <- mean(total[,which(colnames(total)==pollutant)],na.rm=TRUE)}
  return(output)
}


