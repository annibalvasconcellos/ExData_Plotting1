dir_anterior <- getwd()
work_dir <- "C:/R_Programming/Exploratory"
##work_dir <- "C:/New_Documents/Cursos_Big_Data/Exploratory"
setwd(work_dir)
electric <- read.table("household_power_consumption.txt",
                        header = TRUE,sep=";", stringsAsFactors=FALSE, na.strings="?", comment.char="%")
##electric<-read.table("household_power_consumption.txt", 
##                     header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 
electric_2007 <- electric[((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007")),]
electric_2007$Date <- as.Date(electric_2007$Date, format = "%d/%m/%Y")
electric_2007$timetemp <- paste(electric_2007$Date, electric_2007$Time)
electric_2007$Time <- strptime(electric_2007$timetemp, format = "%Y-%m-%d %H:%M:%S")
png(filename="plot2.png", width = 480, height = 480)

plot(electric_2007$Time,as.numeric(as.character(electric_2007$Global_active_power)),
     type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
setwd(dir_anterior)