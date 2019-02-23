## Of the four types of sources indicated by the 
## type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions 
## from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

question3 <- function(outputFile){
        summarySCC <- readData("summarySCC_PM25.rds")
        # print(head(summarySCC))
        
        ## subset it to defined city 
        summarySCC <- subset(summarySCC, fips == "24510")
        
        ## Group data by year 
        summarySCC <- group_by(summarySCC, year, type)
        #check 
        # print(summarySCC)
        ## summarize total emission on grouped data 
        summarySCC <- summarise(summarySCC, totalEmissionType = sum(Emissions ,na.rm = TRUE))
        # print(summarySCC)
        
        ## data is read, plot it 
        # png(outputFile, width=480, height=480)
        # plot(x=summarySCC$year,y=summarySCC$totalEmission,
        #      main="total emissions from PM2.5 in the Baltimore from 1999 to 2008",
        #      col="red"
        # )
        g<-ggplot(data= summarySCC, aes(year,totalEmissionType))
        g<-g+geom_line()+facet_grid(.~type)
        # print(g)
        ggsave(outputFile)
}