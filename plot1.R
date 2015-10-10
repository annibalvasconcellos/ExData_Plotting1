current_dir <- getwd()
work_dir <- "C:/R_Programming/Exploratory"

setwd(work_dir)
electric <- read.csv("household_power_consumption.txt",header = TRUE,sep=";")
electric_2007 <- electric[((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007")),]
electric_2007$Date <- as.Date(electric_2007$Date, format = "%d/%m/%Y")
electric_2007$timetemp <- paste(electric_2007$Date, electric_2007$Time)
electric_2007$Time <- strptime(electric_2007$timetemp, format = "%Y-%m-%d %H:%M:%S")
png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(electric_2007$Global_active_power)),
         col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
setwd(current_dir)
