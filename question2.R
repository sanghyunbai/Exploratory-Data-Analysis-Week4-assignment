## Question 2 :
##Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips=="24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
question2 <- function(outputFile){
        summarySCC <- readData("summarySCC_PM25.rds")
        # print(head(summarySCC))
        
        ## subset it to defined city 
        summarySCC <- subset(summarySCC, fips == "24510")
        
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
             main="total emissions from PM2.5 in the Baltimore from 1999 to 2008",
             col="red"
        )
        dev.off()
}
