data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- format(strptime(data$Time, format = "%H:%M:%S"), format = "%H:%M:%S")
mod_data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
mod_data <- na.omit(mod_data)
png(file = "plot1.png")
par(bg = "transparent")
hist(mod_data$Global_act, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()