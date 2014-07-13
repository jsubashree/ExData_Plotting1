#The code assumes that the file "household_power_consumption.txt" is in the current working directory

sourcefile <- "household_power_consumption.txt"
    data <- read.table(sourcefile,
                     header=TRUE,
                     sep=";",
                     colClasses=c("character", "character", rep("numeric",7)),
                     na="?")
    # convert date and time variables to Date/Time class

    data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")

   # filtering dates for 2007-02-01 and 2007-02-02

    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    data <- subset(data, Date %in% dates)

    png("plot1.png", width=480, height=480)
    
    hist(data$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         col="red")
    
    dev.off()
