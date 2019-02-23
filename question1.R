## Question 1 :
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, 
## make a plot showing the total PM2.5 emission 
## from all sources for each of the years 1999, 2002, 2005, and 2008.

question1 <- function(outputFile){
        summarySCC <- readData("summarySCC_PM25.rds")
        # print(head(summarySCC))
        
        ## Group data by year 
        summarySCC <- group_by(summarySCC, year)
        #check 
        # print(summarySCC)
        ## summarize total emission on grouped data 
        summarySCC <- summarise(summarySCC, totalEmission = sum(Emissions ,na.rm = TRUE))
        # print(summarySCC)
        
        ## data is read, plot it 
        png(outputFile, width=480, height=480)
        plot(x=summarySCC$year,y=summarySCC$totalEmission,
             main="total emissions from PM2.5 in the United States from 1999 to 2008",
             col="red"
             )
        dev.off()
}
