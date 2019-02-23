readData <- function(fileName ,local = TRUE){
        library(tools)
        # print(fileName)
        path<-paste(getwd(),fileName,sep = "/")
        # print(path)
        while(!file.exists(path)){
                returned<-readYesOrNo()
                if(returned ==1){
                        downloadFile()
                }
        }
        print("file found!")
        if(file_ext(fileName) == "rds"){
                return(readRDS(path))
        }
}
readYesOrNo <- function(){ 
        n <- readline(prompt="1(Yes) or 2(No): File does not exist do you want to download? ")
        return(as.integer(n))
}

downloadFile <- function(){
        url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        destZip <- paste(getwd(),"zipfile.zip")
        if(!file.exists(destZip)) {
                download.file(url1, 
                              destfile = destZip
                              )
                unzip(destZip, exdir = ".")
        }
}
