dir_anterior <- getwd()
work_dir <- "C:/R_Programming/Exploratory"
##work_dir <- "C:/New_Documents/Cursos_Big_Data/Exploratory"
setwd(work_dir)
electric <- read.csv("household_power_consumption.txt",header = TRUE,sep=";")
electric_2007 <- electric[((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007")),]
electric_2007$Date <- as.Date(electric_2007$Date, format = "%d/%m/%Y")
electric_2007$timetemp <- paste(electric_2007$Date, electric_2007$Time)
electric_2007$Time <- strptime(electric_2007$timetemp, format = "%Y-%m-%d %H:%M:%S")
png(filename="plot3.png", width = 480, height = 480)

plot(electric_2007$Time,as.numeric(as.character(electric_2007$Sub_metering_1)),
     type="l", xlab = "", ylab="Energy sub metering")
lines(electric_2007$Time,as.numeric(as.character(electric_2007$Sub_metering_2)),col="red")
lines(electric_2007$Time,as.numeric(as.character(electric_2007$Sub_metering_3)),col="blue")

legend("topright", inset=0,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, horiz=FALSE, col = c("black","red","blue"))
dev.off()
setwd(dir_anterior)
