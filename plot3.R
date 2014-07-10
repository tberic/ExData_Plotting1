#read in the whole table
a <- read.table("household_power_consumption.txt", 
                colClasses = c("character", "character", rep("numeric", 7)), 
                sep=";", nrows=2075260, header=TRUE, na.strings="?")

# extract just the dates "2007-02-01" and "2007-02-02"
b <- subset(a, Date == "1/2/2007" | Date == "2/2/2007")

# plot of Global Active Power
png("plot3.png")

plot(b$Sub_metering_1, type = "l", xaxt = "n",
     xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
points(b$Sub_metering_2, type = "l", col = "red")
par(new = TRUE)
points(b$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
axis(1, at = seq(1, dim(b)[1], length=3), labels = c("Thu", "Fri", "Sat"))

dev.off()
